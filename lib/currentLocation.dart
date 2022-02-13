import 'dart:core';
import 'dart:ui';

import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation_2/profile.dart';

import 'colors.dart' as color;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/material.dart';
//import 'package:location/location.dart';

//import 'package:intl/intl.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'NavBar.dart';

class currentLocation extends StatefulWidget {
  const currentLocation({Key? key}) : super(key: key);

  @override
  _currentLocation createState() => _currentLocation();
}

class _currentLocation extends State<currentLocation> {

 var _lat="";
 var _long="";
 var _lat2="";
 var _long2="";
 //var _address="";


 Future<void> _updatePosition() async{
   Position pos = await _determinePosition();
  // List pm = await placemarkFromCoordinates(pos.latitude, pos.longitude);
   setState(() {
     _lat = pos.latitude.toString();
     _long = pos.longitude.toString();
     _lat2 = pos.latitude.toString();
     _long2 = pos.longitude.toString();

     if (_lat == _lat2 && _long==_long2){

       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>profile()));
       Fluttertoast.showToast(msg: "You are present");

     }
     else {
       Fluttertoast.showToast(msg: "You are absent");
       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>profile()));


     }
    // _address = pm[0].toString();

   });



 }

Future<Position> _determinePosition() async{
   bool serviceEnabled;
   LocationPermission permission;
   serviceEnabled = await Geolocator.isLocationServiceEnabled();
   if(!serviceEnabled){
     return Future.error('Location service disabled');

   }
   permission = await Geolocator.checkPermission();
   if(permission == LocationPermission.denied){
     permission = await Geolocator.requestPermission();
     if(permission==LocationPermission.denied){
       return Future.error('Location service denied');

     }

   }
   if(permission==LocationPermission.deniedForever){
     return Future.error('We cannot request');

   }
   return await Geolocator.getCurrentPosition();
}






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Current Location "),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center ,
          children: [
            Icon(Icons.location_on,size:46.0 ,
            color: Colors.blue,
            ),
            SizedBox(height: 10.0,),
            Text("Get Student Location",style:TextStyle(fontSize:26.0,fontWeight: FontWeight.bold ),
                ),
            SizedBox(height: 20.0,
            ),

            FlatButton(
              onPressed://_updatePosition
             _determinePosition
              ,
              color: Colors.blue[800],
           child: Text("Get Current Location",style: TextStyle(color: Colors.white,
           ),),

            )
          ],
        ),
      )
    );
  }
}



