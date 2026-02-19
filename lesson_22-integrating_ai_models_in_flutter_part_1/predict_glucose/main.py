import numpy as np
import pandas as pd
import json
import os

from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score

# ============================================================
# CONFIGURATION
# ============================================================

DATA_PATH = "data/ReplaceBG.parquet"
OUTPUT_DIR = "model"

SAMPLING_MIN = 5
HORIZON = int(30 / SAMPLING_MIN)

# ============================================================
# LOAD DATA
# ============================================================
print("---")
print("Loading ReplaceBG dataset...")
df = pd.read_parquet(DATA_PATH)

# Keep only CGM, date, and id
df = df[["date", "CGM", "id"]]
df["date"] = pd.to_datetime(df["date"])

print(f"Loaded {len(df)} total rows")
print(f"Number of subjects: {df['id'].nunique()}")

print("---")
# ============================================================
# PROCESS EACH SUBJECT
# ============================================================
print("Creating X, Y matrices dividing by subject id...")

all_results = []

patients = np.unique(df['id'])

patients_list = []

for patient in patients:

    # --------------------------------------------
    # Extract and sort
    # --------------------------------------------
    patient_df = df[df['id'] == patient].copy()
    patient_df = patient_df.sort_values("date")

    # --------------------------------------------
    # Compute Rate of Change (mg/dL per minute)
    # --------------------------------------------
    # compute finite differences over 3-step intervals (assuming 15-minute spacing)

    diffs = (patient_df.CGM.values[3:] - patient_df.CGM.values[:-3]) / 15

    # prepend 3 NaNs to keep the array the same length
    patient_df['ROC'] = np.concatenate([np.full(3, np.nan), diffs])

    # append target
    target_CGM = patient_df.CGM.values[HORIZON:]
    # prepend 3 NaNs to keep the array the same length
    patient_df['Y'] = np.concatenate([target_CGM, np.full(HORIZON, np.nan), ])

    # Drop NA
    patient_df = patient_df.dropna()

    patients_list.append(patient_df)

X_train_list = []
X_test_list = []
Y_train_list = []
Y_test_list = []

num_patients = len(patients_list)
split_idx = int(0.8 * num_patients)  # 80% for training

for i, patient_df in enumerate(patients_list):
    cgm = patient_df['CGM'].values
    roc = patient_df['ROC'].values
    y = patient_df['Y'].values  # replace 'Y' with your actual target column

    # Stack CGM and ROC as features
    X = np.column_stack([cgm, roc])

    # Append to train or test lists
    if i < split_idx:
        X_train_list.append(X)
        Y_train_list.append(y)
    else:
        X_test_list.append(X)
        Y_test_list.append(y)

# Concatenate all patients into final matrices
X_train = np.concatenate(X_train_list, axis=0)
X_test = np.concatenate(X_test_list, axis=0)
Y_train = np.concatenate(Y_train_list, axis=0)
Y_test = np.concatenate(Y_test_list, axis=0)

print("---")

print("Training and evaluating model")

# Linear regression pipeline
model = make_pipeline(
    StandardScaler(),
    LinearRegression()
)

model.fit(X_train, Y_train)
y_pred = model.predict(X_test)

# Evaluation
rmse = np.sqrt(mean_squared_error(Y_test, y_pred))
r2 = r2_score(Y_test, y_pred)

print(f"RMSE : {rmse:.2f} mg/dL")
print(f"R²   : {r2:.3f}")
print("---")

# --------------------------------------------
# EXPORT MODEL
# --------------------------------------------

os.makedirs(OUTPUT_DIR, exist_ok=True)

scaler = model.named_steps["standardscaler"]
reg = model.named_steps["linearregression"]

export_dict = {
    "feature_names": ["CGM", "ROC"],
    "mean": scaler.mean_.tolist(),
    "scale": scaler.scale_.tolist(),
    "coef": reg.coef_.tolist(),
    "intercept": float(reg.intercept_)
}

output_path = os.path.join(
    OUTPUT_DIR,
    "cgm_forecast.json"
)

with open(output_path, "w") as f:
    json.dump(export_dict, f, indent=4)

print(f"Model exported to {output_path}")
print("---")

