import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'location.dart';
import 'dart:convert';

class Weather {
  String _API_Key = '99274af176e097a44ce5bdea5a994333';

  Future getDataByCity(String city) async {
    try {
      var weatherData = await http.get(Uri.https(
          'api.openweathermap.org',
          '/data/2.5/weather',
          {'q': '{$city}', "units": "metric", "appid": '$_API_Key'}));

      Map data = jsonDecode(weatherData.body);
      print(data);
      return data;
    } catch (e) {
      print(e);
    }
  }

  Future getData() async {
    //getting location
    Position locationData;
    try {
      locationData = await Location().getLocation();
      print(locationData);
    } catch (e) {
      print(e);
      return 'Couldn\'t get the location.';
    }

    //getting weather data from api
    try {
      dynamic weatherData;
      weatherData = await http
          .get(Uri.https('api.openweathermap.org', '/data/2.5/weather', {
        'lat': {locationData.latitude.toString()},
        'lon': {locationData.longitude.toString()},
        "units": "metric",
        "appid": '$_API_Key'
      }));
      Map data = jsonDecode(weatherData.body);
      print(data);
      return data;
    } catch (e) {
      print(e);
      print('couldn\'t get the weather data from api.');
    }
  }

  IconData getIcon(int statusCode) {
    if (statusCode < 300) {
      return FontAwesomeIcons.cloudBolt;
    } else if (statusCode < 400) {
      return FontAwesomeIcons.cloudRain;
    } else if (statusCode < 600) {
      return FontAwesomeIcons.cloudShowersHeavy;
    } else if (statusCode < 700) {
      return FontAwesomeIcons.snowflake;
    } else if (statusCode < 800) {
      return FontAwesomeIcons.smog;
    } else if (statusCode == 800) {
      return Icons.wb_sunny_outlined;
    } else if (statusCode <= 804) {
      return Icons.cloud;
    } else {
      return FontAwesomeIcons.rainbow;
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Grab \nsunglasses';
    } else if (temp > 20) {
      return 'Get\ndehydrated';
    } else if (temp > 10) {
      return 'Grab \nwarm clothes';
    } else {
      return 'Light up\nyour fireplace';
    }
  }
}
