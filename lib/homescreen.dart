import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Requesting permissions
          await _requestPermissions();
        },
        child: const Icon(Icons.perm_contact_calendar),
      ),
      appBar: AppBar(title: const Text('HomeScreen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: IconButton(
                icon: const Icon(Icons.home),
                onPressed: () async {
                  await _cameraPermission();
                },
                 enableFeedback: true,
              hoverColor: Colors.red,
              ),
            ),
            const SizedBox(height: 20), // Add some space between buttons
            ElevatedButton(
              onPressed: () async {
                // Add your onPressed logic here
                await _calendarPermission();
              },
              child: const Text('Button 1'),
            ),
             const SizedBox(height: 20), // Add some space between buttons
            OutlinedButton(
              onPressed: () async {
                // Add your onPressed logic here
                await _smsPermission();
              },
              child: const Text('Button 2'),
              
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }



  
  // contacts permission
  Future<void> _requestPermissions() async {
    // Requesting READ_CONTACTS and WRITE_CONTACTS permissions
    var status = await Permission.contacts.request();
    if (status.isGranted) {
      // Permission granted, you can proceed with accessing contacts
    } else {
      // Permission denied, handle accordingly
      if (status.isDenied) {
        // User denied permission but you can request again
      } else if (status.isPermanentlyDenied) {
        // User denied permission permanently, navigate to app settings
        openAppSettings();
      }
    }
  }


  // camera permission
  Future<void> _cameraPermission() async {
    var status = await Permission.camera.request();
    if (status.isGranted){
      // Permission granted, you can proceed with accessing camera
    }else{
      if (status.isDenied){
        // user denied permission permanently, navigate to app settings
      }else if (status.isPermanentlyDenied){
        openAppSettings();
      }
    }
  }


  // calendar permission
  Future<void> _calendarPermission() async {
    var status = await Permission.calendarFullAccess.request();
    if (status.isGranted){
      // Permission granted, you can proceed with accessing calendar
    }else{
      if (status.isDenied){
        // user denied permission permanently, navigate to app settings
      }else if (status.isPermanentlyDenied){
        openAppSettings();
      }
    }
  }

  // SMS Permi
  Future<void> _smsPermission() async {
    var status = await Permission.sms.request();
    if (status.isGranted){
      // Permission granted, you can proceed with accessing sms
    }else{
      if (status.isDenied){
        // user denied permission permanently, navigate to app settings
      }else if (status.isPermanentlyDenied){
        openAppSettings();
      }
    }
  }
}

