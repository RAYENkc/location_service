import 'package:flutter/material.dart';
import 'package:location_service/datamodels/user_location.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('location : lat:${userLocation.latitude}, long: ${userLocation.longitude}'),
        ),
      ),
    );
  }
}