import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String city = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/5.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(.7), BlendMode.dstATop),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextButton(
                  onPressed: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    await Future.delayed(Duration(milliseconds: 300));
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    alignment: Alignment.topLeft,
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 25, horizontal: 22)),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(.2),
                        hintText: 'Enter City Name',
                        hintStyle: TextStyle(
                            color: Color.fromARGB(183, 255, 255, 255)),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide.none,
                        ),
                        icon: GestureDetector(
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          child: Icon(
                            Icons.location_city,
                            color: Color(0xa0ffffff),
                            size: 25,
                          ),
                        )),
                    onChanged: (value) {
                      city = value;
                    },
                  ),
                ),
                TextButton(
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      await Future.delayed(Duration(milliseconds: 300));
                      if (city != '') {
                        Navigator.pop(context, city);
                      }
                    },
                    child: Text(
                      'Get Weather',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Spartan',
                        letterSpacing: 1,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
