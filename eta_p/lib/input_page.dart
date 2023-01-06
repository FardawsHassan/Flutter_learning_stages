import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

const Color activeCardColor = Color(0xff1d1e33);
const Color inActiveCardColor = Color(0xff111328);
const Color lebelTextColor = Color(0xff8d8d98);
const Color bottomAppBarColor = Color(0xffEA1556);

const TextStyle lebelTextStyle = TextStyle(
  fontSize: 18,
  color: lebelTextColor,
);

const TextStyle boldTextStyle = TextStyle(
  fontSize: 50,
  color: Colors.white,
  fontWeight: FontWeight.w900,
);

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
                      ? inActiveCardColor
                      : activeCardColor,
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
                      ? inActiveCardColor
                      : activeCardColor,
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
                          style: lebelTextStyle,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.round().toString(),
                            style: boldTextStyle,
                          ),
                          const Text(
                            'cm',
                            style: lebelTextStyle,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: const SliderThemeData(
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: lebelTextColor,
                          thumbColor: bottomAppBarColor,
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
                        style: lebelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: boldTextStyle,
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
                        style: lebelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: boldTextStyle,
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
          Container(
            margin: const EdgeInsets.only(top: 7.5),
            width: double.infinity,
            height: 60.0,
            color: bottomAppBarColor,
            child: const Center(
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
      fillColor: lebelTextColor,
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
          style: lebelTextStyle,
        )
      ],
    );
  }
}

class InputCard extends StatelessWidget {
  final Color background;
  final Widget? cardContent;
  final VoidCallback? onpressed;
  InputCard({
    this.cardContent,
    this.background = const Color(0xff1D1F33),
    this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: cardContent,
        ),
      ),
    );
  }
}
