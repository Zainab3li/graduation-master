import 'dart:core';

import 'package:geolocator/geolocator.dart';
//import 'package:graduation_2/currentuserLocationView.dart';

import 'package:geocoding/geocoding.dart';
import 'currentLocation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'colors.dart' as color;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/material.dart';
//import 'package:location/location.dart';
import 'profile.dart';
//import 'package:intl/intl.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'NavBar.dart';

class fingerprint extends StatefulWidget {
  const fingerprint({Key? key}) : super(key: key);

  @override
  _fingerprintState createState() => _fingerprintState();
}

class _fingerprintState extends State<fingerprint> {

  final auth=LocalAuthentication();
  String authoized = "not authorized";
  bool _canCheckBiometric= false;
  Position? _currentPosition;
  String? _currentAddress;
  bool isLoading = false;
  late List<BiometricType> _avaliavleBiometric;
  var _lat="";
  var _long="";
  var _lat2="";
  var _long2="";
 // Authentication Function
  Future<void> _authenticate() async{
    bool authenticated = false;

    try{

      authenticated= await auth.authenticateWithBiometrics(localizedReason:"Scan your finger to authenticate",
      useErrorDialogs: true,
      stickyAuth: false);
    }
    on PlatformException catch (e){
    print(e);
    }

    setState(() {
      authoized= authenticated? "Success": "Failed to authorized ";
      if(authoized=="Success"){
     //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>currentLocation()));

        _updatePosition();
      }
      else
        print ("your fingerprint did not match");

    });
  }

  Future<void> _updatePosition() async{
    Position pos = await _determinePosition();
    // List pm = await placemarkFromCoordinates(pos.latitude, pos.longitude);
    setState(() {
      _lat = pos.latitude.toString();
      _long = pos.longitude.toString();
      _lat2 =  pos.latitude.toString();
      _long2 = pos.longitude.toString();

      if (_lat == _lat2 && _long==_long2){

        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>profile()));
        Fluttertoast.showToast(msg: "You are present");

      }
      else {

        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>profile()));
        Fluttertoast.showToast(msg: "You are absent");

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
  Future<void> _checkBiometric() async{

    bool canCheckBiometric= false;

    try{
      canCheckBiometric= await auth.canCheckBiometrics;
    } on PlatformException catch (e){
      print(e);
    }
    if(!mounted)return;
    setState(() {
      _canCheckBiometric = canCheckBiometric;

    });

  }

  Future _getAvailableBiometric() async{
     List<BiometricType> avaliableBiometric= [];

    try{
      avaliableBiometric= await auth.getAvailableBiometrics();

    }on PlatformException catch (e){
      print(e);
    }

    setState(() {
      _avaliavleBiometric = avaliableBiometric;

    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkBiometric();
    _getAvailableBiometric();
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        actions: [
        ],
      ),
      drawer: menu(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom:180,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[
            SizedBox(height: 20,),
            Center(

              child: Text("Biomatric Authentication",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 50.0),


                child: Column(
                  children: <Widget>[
                    Image.asset(
                      "assets/Fingerprint.png",
                      // width: 220,
                      height: 230,
                    ),
                  ],
                ),

            ),
            Text("Fingerprint Authentication",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30,),
            Text("Authenticate using your fingerprint insted of your voice",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60,),
            Container(
              width: 180,
              height: 50,
              alignment: Alignment.center,
              child: RaisedButton(
                onPressed:() { _authenticate();
                  },
                color: color.AppColor.gradianS,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical:14.0 ,horizontal: 24.0),
                  child: Text("Authenticate", style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
              ),

            ),
          ],
        ),
      ),
    );
  }

}



