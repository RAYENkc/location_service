import 'package:flutter/material.dart';
import 'package:location_service/datamodels/user_location.dart';
import 'package:location_service/services/location_service.dart';
import 'package:location_service/view/home_view.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
      //verfication of version
      create:(context) => LocationService().locationStream,
      child: MaterialApp(
         title: 'test',
         home: HomeView(),
      ) ,
      
    );
    
  }
}

