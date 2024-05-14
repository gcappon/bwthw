import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:polar_sync/widgets/form_tiles.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PolarSettingsPage extends StatelessWidget {
  PolarSettingsPage({Key? key}) : super(key: key);

    final TextEditingController _textFieldIdentifierController =
      TextEditingController();
    final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Polar Sensor Settings'),
        actions: [
          IconButton(onPressed:  () async => await _validateAndSave(context), icon: Icon(Icons.done))
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder:(context, snapshot) {
            if(snapshot.hasData){
              final sp = snapshot.data!;
              final polar_id = sp.getString('polar_id');
              if(polar_id != null){
                _textFieldIdentifierController.text = polar_id;
              }
              return _buildForm(context);
            }else{
              return CircularProgressIndicator();
            }

        },),
      ),
    );
  }//build 


    Widget _buildForm(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 8, left: 20, right: 20),
        child: ListView(
          children: <Widget>[
            FormTextTile(
              labelText: 'Sensor ID',
              controller: _textFieldIdentifierController,
              icon: MdiIcons.heart,
            ),
          ],
        ),
      ),
    );
  } // _buildForm

  Future<void> _validateAndSave(BuildContext context) async {
    if(formKey.currentState!.validate()){
      final sp = await SharedPreferences.getInstance();
      sp.setString('polar_id', _textFieldIdentifierController.text);
      Navigator.pop(context);
    }
  } // _validateAndSave
  
}//PolarSettingsPage