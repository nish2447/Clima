import 'package:geolocator/geolocator.dart';

class Location {
  var latitude;
  var longitude;

  Future<void> getLocation() async {
    //more accuracy  --> more battery expensive
    try{
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);


    latitude = position.latitude;
    longitude = position.longitude;
    }catch(e)
    {
      print(e);
    }
  }

}