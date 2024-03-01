import 'package:permission_handler/permission_handler.dart';

class CameraPermissionHandler {
  static Future<bool> requestPermission() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      // Permission granted, you can proceed with accessing camera
      return true;
    } else {
      if (status.isDenied) {
        // User denied permission but you can request again
      } else if (status.isPermanentlyDenied) {
        // User denied permission permanently, navigate to app settings
        openAppSettings();
      }
      return false;
    }
  }
}