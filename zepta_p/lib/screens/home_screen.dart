import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zepta_p/utilities/constants.dart';
import 'package:zepta_p/services/weather.dart';
import 'city_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({this.weatherData});

  dynamic weatherData;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String city = '';
  double temperature = 0;
  IconData? weatherIcon;
  String weatherMessage = '';
  String weatherDesc = '';
  Duration nextEventduration = Duration.zero;
  String nextEvent = '';
  String eventToHappen = '';

  void setNextEvent(DateTime sunrise, DateTime sunset) {
    Duration fromSunrise = sunrise.difference(DateTime.now());
    Duration fromSunset = sunset.difference(DateTime.now());
    Duration afterSunset = DateTime.now().difference(sunset);
    // int tmp = fromSunrise.compareTo(fromSunset);
    // print(sunrise);
    // print(sunset);
    // if (tmp > 0) {
    //   nextEvent = 'sunset';
    //   nextEventduration = fromSunset;
    // } else {
    //   nextEvent = 'sunrise';
    //   nextEventduration = fromSunrise;
    // }
    // print(nextEventduration.toString());

    if (DateTime.now().compareTo(sunrise) < 0) {
      eventToHappen = 'before';
      nextEvent = 'sunrise';
      nextEventduration = fromSunrise;
    } else if (DateTime.now().compareTo(sunset) < 0) {
      eventToHappen = 'before';
      nextEvent = 'sunset';
      nextEventduration = fromSunset;
    } else {
      eventToHappen = 'after';
      nextEvent = 'sunset';
      nextEventduration = afterSunset;
    }
  }

  void setData(dynamic weatherData) {
    city = widget.weatherData['name'];
    temperature = widget.weatherData['main']['temp'];
    weatherDesc = widget.weatherData['weather'][0]['description'];

    Weather weatherInstance = Weather();
    var condition = widget.weatherData['weather'][0]['id'];
    weatherIcon = weatherInstance.getIcon(condition);
    weatherMessage = weatherInstance.getMessage(temperature.toInt());

    DateTime sunrise = DateTime.fromMillisecondsSinceEpoch(
        widget.weatherData['sys']['sunrise'] * 1000);
    DateTime sunset = DateTime.fromMillisecondsSinceEpoch(
        widget.weatherData['sys']['sunset'] * 1000);
    setNextEvent(sunrise, sunset);
  }

  @override
  void initState() {
    super.initState();
    setData(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/cloudy.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(.8), BlendMode.dstATop),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(50, 40),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.all(0),
                      alignment: Alignment.topLeft,
                    ),
                    onPressed: () async {
                      // var weatherData = await Weather().getData();
                      // setState(() {
                      //   setData(weatherData);
                      // });
                      Navigator.pop(context, true);
                    },
                    child: Icon(
                      FontAwesomeIcons.locationArrow,
                      size: 28,
                      color: Color(0x80ffffff),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(50, 40),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsets.all(0),
                      alignment: Alignment.topRight,
                    ),
                    onPressed: () async {
                      var city = await Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return CityScreen();
                      })));
                      print(city);
                      // var weatherData = await Weather().getDataByCity(city);
                      // setState(() {
                      //   setData(weatherData);
                      // });
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 28,
                      color: Color(0x90ffffff),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      weatherIcon,
                      size: 90,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          temperature.toInt().toString(),
                          style: kLargeBoldFontStyle,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                height: 70,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 7, color: Colors.white)),
                                ),
                                child: Text(
                                  'o',
                                  style: kMediumBoldFontStyle,
                                ),
                              ),
                              Text(
                                'now',
                                style: kLightBoldFontStyle,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Text(
                      weatherMessage,
                      style: kRegularBoldTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'There is $weatherDesc in\n$city',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                color: Color(0xff7BCBCA),
                elevation: 10,
                margin: EdgeInsets.fromLTRB(5, 50, 5, 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (nextEventduration.inHours < 10)
                                ? '0' +
                                    nextEventduration.inHours.toString() +
                                    'h'
                                : nextEventduration.inHours.toString() + 'h',
                            style: kMediumTextStyle,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            nextEventduration.inMinutes
                                    .remainder(60)
                                    .toString() +
                                'min',
                            style: kMediumTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sunny_snowing,
                            size: 32,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '$eventToHappen $nextEvent',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
