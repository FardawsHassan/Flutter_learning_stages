import 'package:eta_p/screens/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../calculator_brain.dart';
import '../components/input_card.dart';
import '../components/bottom_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  double height = 180;
  int age = 25;
  int weight = 56;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                InputCard(
                  cardContent: GenderCardContent(FontAwesomeIcons.mars, 'MALE'),
                  onpressed: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  background: selectedGender != Gender.male
                      ? kInactiveCardColor
                      : kActiveCardColor,
                ),
                InputCard(
                  cardContent:
                      GenderCardContent(FontAwesomeIcons.venus, 'FEMALE'),
                  onpressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  background: selectedGender != Gender.female
                      ? kInactiveCardColor
                      : kActiveCardColor,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                InputCard(
                  cardContent: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                        child: Text(
                          'HEIGHT',
                          style: klebelTextStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.round().toString(),
                            style: kboldTextStyle,
                          ),
                          const Text(
                            'cm',
                            style: klebelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: const SliderThemeData(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: klebelTextColor,
                          thumbColor: kbottomAppBarColor,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 11),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 22),
                          overlayColor: Color(0x30EA1556),
                          trackShape: RectangularSliderTrackShape(),
                        ),
                        child: Slider(
                          value: height,
                          min: 0.0,
                          max: 350.0,
                          onChanged: (double newHeight) {
                            setState(() {
                              height = newHeight;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                InputCard(
                  cardContent: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: klebelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kboldTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            icon: FontAwesomeIcons.minus,
                            onpressed: (() {
                              setState(() {
                                weight > 0 ? weight-- : null;
                              });
                            }),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          CustomButton(
                            icon: FontAwesomeIcons.plus,
                            onpressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                InputCard(
                  cardContent: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: klebelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kboldTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            icon: FontAwesomeIcons.minus,
                            onpressed: (() {
                              setState(() {
                                age > 0 ? age-- : null;
                              });
                            }),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          CustomButton(
                            icon: FontAwesomeIcons.plus,
                            onpressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            lebel: 'CALCULATE',
            onpressed: () {
              CalculatorBrain bmiCalc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Result(
                          bmi: bmiCalc.calculate(),
                          messege: bmiCalc.messege(),
                          result: bmiCalc.result()))));
            },
          ),
        ],
      ),
    );
  }
}

// Custom Widgets

class CustomButton extends StatelessWidget {
  IconData icon;
  VoidCallback? onpressed;
  CustomButton({required this.icon, this.onpressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onpressed,
      elevation: 0,
      shape: CircleBorder(),
      fillColor: klebelTextColor,
      constraints: const BoxConstraints.tightFor(
        width: 45.0,
        height: 45.0,
      ),
      child: Icon(
        icon,
      ),
    );
  }
}

class GenderCardContent extends StatelessWidget {
  final IconData icon;
  final String iconLebel;
  GenderCardContent(this.icon, this.iconLebel);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          iconLebel,
          style: klebelTextStyle,
        )
      ],
    );
  }
}
