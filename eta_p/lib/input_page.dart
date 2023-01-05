import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender {
  male,
  female,
}

const Color activeCardColor = Color(0xff1d1e33);
const Color inActiveCardColor = Color(0xff111328);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
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
                  cardContent: InputCardContent(FontAwesomeIcons.mars, 'MALE'),
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
                      InputCardContent(FontAwesomeIcons.venus, 'FEMALE'),
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
                InputCard(),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                InputCard(),
                InputCard(),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 7.5),
            width: double.infinity,
            height: 60.0,
            color: const Color(0xffEA1556),
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

class InputCardContent extends StatelessWidget {
  final IconData icon;
  final String iconLebel;
  InputCardContent(this.icon, this.iconLebel);

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
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xff8d8d98),
          ),
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
