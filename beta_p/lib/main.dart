import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.blueGrey[900],
                backgroundImage: AssetImage('images/shuvro.png'),
              ),
              Text(
                'Fardaws Hassan',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  fontSize: 20,
                  color: Colors.teal[100],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 150,
                height: 20,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                color: Colors.grey.shade100,
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+880 179 773 6503',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.teal.shade900,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.grey.shade100,
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'fardawshassan@gmail.com',
                    style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.teal.shade900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}




// Container(
//                 color: Colors.grey.shade100,
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.call,
//                       color: Colors.teal,
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       '+880 179 773 6503',
//                       style: TextStyle(
//                         fontFamily: 'SourceSansPro',
//                         fontSize: 20,
//                         color: Colors.teal.shade900,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 color: Colors.grey.shade100,
//                 padding: EdgeInsets.all(10),
//                 margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.email,
//                       color: Colors.teal,
//                     ),
//                     SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       'fardawshassan@gmail.com',
//                       style: TextStyle(
//                         fontFamily: 'SourceSansPro',
//                         fontSize: 20,
//                         color: Colors.teal.shade900,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),