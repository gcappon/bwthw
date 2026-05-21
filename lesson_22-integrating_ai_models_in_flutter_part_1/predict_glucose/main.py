import numpy as np
import pandas as pd
import json
import os

from sklearn.pipeline import make_pipeline
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score


print("---")
print("Loading dataset...")

# Load data
df = pd.read_parquet('data/ReplaceBG.parquet')

# Keep only CGM, date, and id columns for simplicity
df = df[["date", "CGM", "id"]]
df["date"] = pd.to_datetime(df["date"])

print("---")
print("Creating X, Y matrices ...")

# Get the list of patients that are present in the dataset
patients = np.unique(df['id'])
num_patients = len(patients)

# Create an empty list that will contain all the processed data
patients_list = []

# Initialize the lists for training and test data
X_train_list = []
X_test_list = []
Y_train_list = []
Y_test_list = []

# Identify the split point corresponding to 80% of total patients.
split_idx = int(0.8 * num_patients)  # 80% for training

for i, patient in enumerate(patients):

    # Extract the patient-specific data, put them in a dataframe and sort rows by timestamp
    patient_df = df[df['id'] == patient].copy()
    patient_df = patient_df.sort_values("date")

    # As an additional feature, let's compute the glucose rate-of-change (in the last 15 minutes)
    diffs = (patient_df.CGM.values[3:] - patient_df.CGM.values[:-3]) / 15

    # Prepend 3 NaNs to keep the array the same length and put it in the dataframe
    patient_df['ROC'] = np.concatenate([np.full(3, np.nan), diffs])

    # Create the target vector shifting it by 6 samples (i.e., 30 minutes)
    target_CGM = patient_df.CGM.values[6:]

    # prepend 6 NaNs to keep the array the same length and put it in the dataframe
    patient_df['Y'] = np.concatenate([target_CGM, np.full(6, np.nan), ])

    # Drop NA (this is for simplicity)
    patient_df = patient_df.dropna()

    # Get the final features
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

# Create a pipeline for linear regression
model = make_pipeline(StandardScaler(), LinearRegression())

# Train the model
model.fit(X_train, Y_train)

# Get the predictions
y_pred = model.predict(X_test)

# Evaluate model performance
rmse = np.sqrt(mean_squared_error(Y_test, y_pred))
r2 = r2_score(Y_test, y_pred)

print(f"RMSE : {rmse:.2f} mg/dL")
print(f"R²   : {r2:.3f}")

print("---")
print("Exporting model...")

# Create output directory if it does not exist
os.makedirs('model', exist_ok=True)

# Get the scaler and regression model objects
scaler = model.named_steps["standardscaler"]
reg = model.named_steps["linearregression"]

# Create the dictionary to be exported
export_dict = {
    "feature_names": ["CGM", "ROC"],
    "mean": scaler.mean_.tolist(),
    "scale": scaler.scale_.tolist(),
    "coef": reg.coef_.tolist(),
    "intercept": float(reg.intercept_)
}

# Export models
with open(os.path.join('model', 'cgm_forcast.json'), "w") as f:
    json.dump(export_dict, f, indent=4)

print("Model exported")
print("---")
