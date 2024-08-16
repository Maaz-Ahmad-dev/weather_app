import 'package:geolocator/geolocator.dart';

Future<Position> getLocation() async {
  //checks if permission is granted
  LocationPermission loc_perm = await Geolocator.checkPermission();

  // It request for permission if it is not granted
  if (loc_perm == LocationPermission.denied) {
    loc_perm = await Geolocator.requestPermission();
  }
  //Error if permission is not granted
  if (loc_perm == LocationPermission.denied) {
    return Future.error("Location permission denied");
  }
  // Error if permission is denied permanently
  if (loc_perm == LocationPermission.deniedForever) {
    return Future.error(
        "Location permission are permanantly denied. We can not request permission");
  }

  return await Geolocator.getCurrentPosition();
}
