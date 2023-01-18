import 'package:geolocator/geolocator.dart';

class Location {
  Position? _locationData;

  dynamic getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    try {
      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        print('Location service disable');
        return 'Location service disable';
      }

      // Check and request permission.
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          return 'Location permission are denied forever.';
        }
        if (permission == LocationPermission.denied) {
          return 'Location permission denied';
        }
      }

      _locationData = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      return _locationData;
    } catch (e) {
      print(e);
      print('Couldn\'t get the location.');
      return {'statusCode': 404};
    }
  }
}
