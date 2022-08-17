import 'package:location/location.dart';

class UserLocation {
  UserLocation._privateConstructor();

  // Singleton class
  static final UserLocation instance = UserLocation._privateConstructor();

  Future<LocationData> getUserCurrentPosition() async {
    try {
      bool serviceEnabled;
      PermissionStatus permission;
      Location location = Location();

      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          throw Exception('Location services are disabled');
        }
      }

      permission = await location.hasPermission();
      if (permission == PermissionStatus.denied) {
        permission = await location.requestPermission();
        if (permission != PermissionStatus.granted) {
          throw Exception('Location permissions are denied');
        }
      }

      if (permission == PermissionStatus.deniedForever) {
        throw Exception('Location permissions are permanently denied, we cannot request permissions.');
      }

      return await location.getLocation();
    } catch (e) {
      rethrow;
    }
  }
}
