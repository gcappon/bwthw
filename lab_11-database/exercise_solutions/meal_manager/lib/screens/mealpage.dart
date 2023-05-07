import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:meal_manager/database/entities/meal.dart';
import 'package:meal_manager/repositories/databaseRepository.dart';
import 'package:meal_manager/widgets/formTiles.dart';
import 'package:meal_manager/widgets/formSeparator.dart';
import 'package:meal_manager/utils/formats.dart';
import 'package:provider/provider.dart';

//This is the class that implement the page to be used to edit existing meals and add new meals.
//This is a StatefulWidget since it needs to rebuild when the form fields change.
class MealPage extends StatefulWidget {
  //We are passing the Meal to be edited. If it is null, the business logic will know that we are adding a new 
  //Meal instead.
  final Meal? meal;

  //MealPage constructor
  MealPage({Key? key, required this.meal})
      : super(key: key);

  static const route = '/meal';
  static const routeDisplayName = 'Meal page';

  @override
  State<MealPage> createState() => _MealPageState();
} //MealPage

//Class that manages the state of MealPage
class _MealPageState extends State<MealPage> {
  //Form globalkey: this is required to validate the form fields.
  final formKey = GlobalKey<FormState>();

  //Variables that maintain the current form fields values in memory.
  TextEditingController _choController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  //Here, we are using initState() to initialize the form fields values.
  //Rationale: Meal content and time are not known is the meal is new (meal == null).
  // In this case, initilize them to empty and now(), respectively, otherwise set them to the respective values.
  @override
  void initState() {
    _choController.text =
        widget.meal == null ? '' : widget.meal!.carbohydrates.toString();
    _selectedDate =
        widget.meal == null ? DateTime.now() : widget.meal!.dateTime;
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
          IconButton(
              onPressed: () => _validateAndSave(context),
              icon: Icon(Icons.done),)
        ],
      ),
      body: Center(
        child: _buildForm(context),
      ),
      floatingActionButton: widget.meal == null
          ? null
          : FloatingActionButton(
              onPressed: () => _deleteAndPop(context),
              child: Icon(Icons.delete),
            ),
    );
  } //build

  //Utility method used to build the form.
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
        return pickedTime != null
            ? value.add(
                Duration(hours: pickedTime.hour, minutes: pickedTime.minute))
            : null;
      }
      return null;
    });
    if (picked != null && picked != _selectedDate)
      //Here, I'm using setState to update the _selectedDate field and rebuild the UI.
      setState(() {
        _selectedDate = picked;
      });
  } //_selectDate

  //Utility method that validate the form and, if it is valid, save the new meal information.
  void _validateAndSave(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      //If the original Meal passed to the MealPage was null, then add a new Meal...
      if(widget.meal == null){
        Meal newMeal =
          Meal(null, double.parse(_choController.text), _selectedDate);
          await Provider.of<DatabaseRepository>(context, listen: false)
              .insertMeal(newMeal);
      }//if
      //...otherwise, edit it.
      else{
        Meal updatedMeal =
          Meal(widget.meal!.id, double.parse(_choController.text), _selectedDate);
          await Provider.of<DatabaseRepository>(context, listen: false)
              .updateMeal(updatedMeal);
      }//else
      Navigator.pop(context);
    }//if
  } // _validateAndSave

  //Utility method that deletes a meal entry.
  void _deleteAndPop(BuildContext context) async{
    await Provider.of<DatabaseRepository>(context, listen: false)
              .removeMeal(widget.meal!);
    Navigator.pop(context);
  } //_deleteAndPop

} //MealPage
