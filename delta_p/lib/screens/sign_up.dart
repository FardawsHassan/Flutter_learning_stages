import 'package:delta_p/screens/sign_in.dart';
import 'package:flutter/material.dart';
import '../components/input_field.dart';
import '../components/buttons.dart';
import '../components/form_footer.dart';
import '../utilities/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  MainAxisSize signingPageHeight = MainAxisSize.min;
  //outfocus signing page height
  Future bodySizeMin() async {
    await Future.delayed(const Duration(microseconds: 1000));
    setState(() {
      signingPageHeight = MainAxisSize.min;
    });
  }

  //onfocus signing page height
  void bodySizeMax() {
    setState(() {
      signingPageHeight = MainAxisSize.max;
    });
  }

  String? name;
  String? phone;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          bodySizeMin();
        },
        child: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: kInputBackgroundImage,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: const Color(0xffF2F2F2),
                ),
                child: Column(
                  mainAxisSize: signingPageHeight,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 45, 0, 20),
                      child: Text(
                        'Create Account',
                        style: kFormTitleTextStyle,
                      ),
                    ),
                    Focus(
                      onFocusChange: (value) {
                        bodySizeMax();
                      },
                      child: InputField(
                        lebel: 'Full Name',
                        passValue: (String value) {
                          setState(() {
                            name = value;
                          });
                        },
                      ),
                    ),
                    Focus(
                      onFocusChange: (value) {
                        bodySizeMax();
                      },
                      child: InputField(
                        lebel: 'Phone Number',
                        passValue: (String value) {
                          setState(() {
                            phone = value;
                          });
                        },
                      ),
                    ),
                    Focus(
                      onFocusChange: (value) {
                        bodySizeMax();
                      },
                      child: InputField(
                        lebel: 'Email Address',
                        passValue: (String value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                    ),
                    Focus(
                      onFocusChange: (value) {
                        bodySizeMax();
                      },
                      child: InputField(
                        hideText: true,
                        lebel: 'Password',
                        passValue: (String value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 45),
                      child: SigningButton(
                        lebel: 'Sign Up',
                        onpress: () {
                          print(name);
                          print(phone);
                          print(email);
                          print(password);
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 55, 10, 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          signing_footer_text(
                            txt: 'Already have an account.  ',
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignIn();
                            })),
                            child: const Text(
                              'Sign In',
                              style: kSigningFooterTextStyle,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
