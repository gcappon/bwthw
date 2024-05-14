import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_design_icons/flutter_material_design_icons.dart';
import 'package:intl/intl.dart';
import 'package:polar/polar.dart';
import 'package:polar_sync/models/heart_rate_data.dart';
import 'package:polar_sync/screens/polar_settings_page.dart';
import 'package:polar_sync/widgets/line_plot.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:to_csv/to_csv.dart' as exportCSV;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
} //HomePage

class _HomePageState extends State<HomePage> {
  String? identifier;

  final polar = Polar();
  final logs = ['Service started'];

  List<HeartRateData> heartRateData = [];

  bool recording = false;

  @override
  void initState() {
    super.initState();
    polar.batteryLevel.listen((e) => print('Battery: ${e.level}'));
    polar.deviceConnecting.listen((_) => print('Device connecting'));
    polar.deviceConnected.listen((_) => print('Device connected'));
    polar.deviceDisconnected.listen((_) => print('Device disconnected'));
  } //initState

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Polar Sync'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'Polar Sync',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            ListTile(
              leading: Icon(MdiIcons.heart),
              title: Text('Polar Sensor Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PolarSettingsPage()));
              },
            ),
            ListTile(
              leading: Icon(MdiIcons.fileExcel),
              title: Text('Export Data to CSV'),
              onTap: () {
                List<String> header = [];
                header.add('time');
                header.add('value');
                List<List<String>> listOfLists = [];
                for (var element in heartRateData) {
                  listOfLists.add([
                    DateFormat('yyyy-MM-dd HH:mm:ss').format(element.time),
                    element.value.toString()
                  ]);
                }
                exportCSV.myCSV(header, listOfLists, fileName: 'polar_session');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            heartRateData.length == 0
                ? Text('Nothing to display')
                : HeartRateDataPlot(heartRateData: heartRateData),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (recording) {
            bool toStop = await showDialog(
              context: context,
              builder: (_) => CupertinoAlertDialog(
                title: Text('Stop?'),
                content: Text('Stop current session?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text('No')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text('Yes')),
                ],
              ),
              barrierDismissible: false,
            );

            if (toStop) {
              print('Disconnecting from device: $identifier');
              polar.disconnectFromDevice(identifier!);
              recording = false;
            } //if-toStop
          } else {
            bool toStart = await showDialog(
              context: context,
              builder: (_) => CupertinoAlertDialog(
                title: Text('Start?'),
                content: Text('Start new session?'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: Text('No')),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: Text('Yes')),
                ],
              ),
              barrierDismissible: false,
            );
            if(toStart){
              heartRateData.clear();
              final sp = await SharedPreferences.getInstance();
              identifier = sp.getString('polar_id');
              print('Connecting to device: $identifier');
              polar.connectToDevice(identifier!);
              streamWhenReady(context);
              recording = true;
            }//if-toStop
          } //else

          setState(() {});
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          recording ? Icons.stop : Icons.play_arrow,
        ),
      ),
    );
  } //build

  void streamWhenReady(BuildContext context) async {
    await polar.sdkFeatureReady.firstWhere(
      (e) =>
          e.identifier == identifier &&
          e.feature == PolarSdkFeature.onlineStreaming,
    );
    final availabletypes =
        await polar.getAvailableOnlineStreamDataTypes(identifier!);

    debugPrint('available types: $availabletypes');

    if (availabletypes.contains(PolarDataType.hr)) {
      polar.startHrStreaming(identifier!).listen((e) {
        for (var element in e.samples) {
          heartRateData
              .add(HeartRateData(time: DateTime.now(), value: element.hr));
        }
        setState(() {});
      });
    }
  }
}
