import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double? lat;
  double? lon;
  void getLocation() async {
      Location location = Location();
      await location.getCurrentLocation();
      lat = location.latitude;
      lon = location.longitude;
  }
  @override
  void initState() {

    super.initState();
    getLocation();
  }

  void getData () async {
    http.Response response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=4acfdf041fdcb8e53da865a72d723bea'));
    if(response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
      print("No result found");
    }
  }
  @override

  void deactive() {
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {

            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
