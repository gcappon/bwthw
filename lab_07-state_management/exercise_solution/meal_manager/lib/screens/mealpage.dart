import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:meal_manager/models/meal.dart';
import 'package:meal_manager/models/mealDB.dart';
import 'package:meal_manager/widgets/formTiles.dart';
import 'package:meal_manager/widgets/formSeparator.dart';
import 'package:meal_manager/utils/formats.dart';

//This is the class that implement the page to be used to edit existing meals and add new meals.
//This is a StatefulWidget since it needs to rebuild when the form fields change.
class MealPage extends StatefulWidget {

  //MealPage needs to know the index of the meal we are editing (it is equal to -1 if the meal is new)
  final int mealIndex;
  //For simplicity, even if it is not necessary, we are also passing the instance of MealDB. 
  //This choice is not mandatory and maybe redundant, but it will allow us to initialize easily the form values.
  final MealDB mealDB;

  //MealPage constructor
  MealPage({Key? key, required this.mealDB, required this.mealIndex}) : super(key: key);

  static const route = '/meal';
  static const routeDisplayName = 'Meal page';

  @override
  State<MealPage> createState() => _MealPageState();
}//MealPage

//Class that manages the state of MealPage
class _MealPageState extends State<MealPage> {

  //Form globalkey: this is required to validate the form fields.
  final formKey = GlobalKey<FormState>();

  //Variables that maintain the current form fields values in memory.
  TextEditingController _choController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  
  //Here, we are using initState() to initialize the form fields values.
  //Rationale: Meal content and time are not known is the meal is new (mealIndex == -1). 
  //  In this case, initilize them to empty and now(), respectively, otherwise set them to the respective values.
  @override
  void initState() {
    _choController.text = widget.mealIndex == -1 ? '' : widget.mealDB.meals[widget.mealIndex].carbohydrates.toString();
    _selectedDate = widget.mealIndex == -1 ? DateTime.now() : widget.mealDB.meals[widget.mealIndex].dateTime;
    super.initState();
  } // initState

  //Remember that form controllers need to be manually disposed. So, here we need also to override the dispose() method.
  @override
  void dispose() {
    _choController.dispose();
    super.dispose();
  } // dispose

  @override
  Widget build(BuildContext context) {    

    //Print the route display name for debugging
    print('${MealPage.routeDisplayName} built');

    //The page is composed of a form. An action in the AppBar is used to validate and save the information provided by the user.
    //A FAB is showed to provide the "delete" functinality. It is showed only if the meal already exists.
    return Scaffold(
      appBar: AppBar(
        title: Text(MealPage.routeDisplayName),
        actions: [
          IconButton(onPressed: () => _validateAndSave(context), icon: Icon(Icons.done))
        ],
      ),
      body: Center(
        child: _buildForm(context),
      ),
      floatingActionButton: widget.mealIndex == -1 ? null : FloatingActionButton(onPressed: () => _deleteAndPop(context), child: Icon(Icons.delete),),
    );
  }//build

  //Utility method used to build the form.
  //Here, I'm showing to you how to do some new things:
  //1. How to actually implement a Form;
  //2. Define custom-made FormTiles (take a look at the widgets/formSeparator.dart and widgets/formTiles.dart files);
  //3. How to implement a Date+Time picker (take a look at the _selectDate utility method).
  Widget _buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 8, left: 20, right: 20),
        child: ListView(
          children: <Widget>[
            FormSeparator(label: 'Meal content'),
            FormNumberTile(
              labelText: 'Carbohydrates',
              controller: _choController,
              icon: MdiIcons.pasta,
            ),
            FormSeparator(label: 'Meal time'),
            FormDateTile(
              labelText: 'Meal Time',
              date: _selectedDate,
              icon: MdiIcons.clockTimeFourOutline,
              onPressed: () {
                _selectDate(context);
              },
              dateFormat: Formats.fullDateFormatNoSeconds,
            ),
          ],
        ),
      ),
    );
  } // _buildForm

  //Utility method that implements a Date+Time picker. 
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: _selectedDate,
            firstDate: DateTime(2010),
            lastDate: DateTime(2101))
        .then((value) async {
      if (value != null) {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(
              hour: _selectedDate.hour, minute: _selectedDate.minute),
        );
        return pickedTime != null ? value.add(
              Duration(hours: pickedTime.hour, minutes: pickedTime.minute)) : null;
      }
      return null;
    });
    if (picked != null && picked != _selectedDate)
      //Here, I'm using setState to update the _selectedDate field and rebuild the UI.
      setState(() {
        _selectedDate = picked;
      });
  }//_selectDate

  //Utility method that validate the form and, if it is valid, save the new meal information.
  void _validateAndSave(BuildContext context) {
    if(formKey.currentState!.validate()){
      Meal newMeal = Meal(carbohydrates: double.parse(_choController.text), dateTime: _selectedDate);
      widget.mealIndex == -1 ? widget.mealDB.addMeal(newMeal) : widget.mealDB.editMeal(widget.mealIndex, newMeal);
      Navigator.pop(context);
    }
  } // _validateAndSave

  //Utility method that deletes a meal entry.
  void _deleteAndPop(BuildContext context){
    widget.mealDB.deleteMeal(widget.mealIndex);
    Navigator.pop(context);
  }//_deleteAndPop

} //MealPage
