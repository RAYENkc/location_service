import 'dart:async';

import 'package:location/location.dart';
import 'package:location_service/datamodels/user_location.dart';

class LocationService{
  //keep track of current location
  UserLocation _currentLocation;
  Location location = Location();

  //Continuously emit location updates
  StreamController<UserLocation> _locationController =
    StreamController<UserLocation>.broadcast();

  LocationService(){
    location.requestPermission().then((granted){
      if(granted != null){
        location.onLocationChanged().listen((locationData){
           if(locationData != null){
             _locationController.add(UserLocation(
               locationData.latitude,
               locationData.longitude,
                ));
           }

        });
      }
    });
  }


  Stream<UserLocation> get locationStream => _locationController.stream;
  

  

  Future<UserLocation> getLocation() async {
    try{
      var userLocation = await location.getLocation();
      _currentLocation = UserLocation(
         userLocation.latitude,
         userLocation.longitude,
        );

    }catch(e){
       print('could not get the location $e');
    }

    return _currentLocation;
  }
}