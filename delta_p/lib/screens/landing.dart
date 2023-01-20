import 'package:flutter/material.dart';
import '../components/buttons.dart';
import '../screens/sign_in.dart';
import '../screens/sign_up.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    color: const Color(0xffF2F2F2),
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                      image: AssetImage('images/4.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(35.0),
                    child: Text(
                      'Gossipper',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  'Share your thoughts with GoSSipper!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 7.5, 15, 7.5),
                child: SigningButton(
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SignIn();
                      }),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 7.5, 15, 15),
                child: SigningButton(
                  bgColor: Colors.white,
                  fgColor: Colors.black87,
                  lebel: 'Sign Up',
                  onpress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return SignUp();
                      }),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
