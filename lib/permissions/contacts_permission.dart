import 'package:permission_handler/permission_handler.dart';



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