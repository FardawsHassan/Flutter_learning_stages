import 'package:delta_p/components/buttons.dart';
import 'package:delta_p/screens/sign_up.dart';
import 'package:flutter/material.dart';
import '../components/input_field.dart';
import '../utilities/constants.dart';
import '../components/form_footer.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: kInputBackgroundImage,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // height: MediaQuery.of(context).size.height * .5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: const Color(0xffF2F2F2),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 45, 0, 20),
                      child: Text(
                        'Sign In',
                        style: kFormTitleTextStyle,
                      ),
                    ),
                    InputField(
                      lebel: 'Email Address',
                    ),
                    InputField(
                      hideText: true,
                      lebel: 'Password',
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 45),
                      child: SigningButton(),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 55, 10, 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          signing_footer_text(
                            txt: 'I am new User.   ',
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignUp();
                            })),
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff9B4AFE),
                              ),
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
