import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questions.dart';

QuizBrain quizBrain = QuizBrain();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizzer',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Icon> scores = [];

  void check_ans(bool ans) {
    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          title: "Finished!",
          desc: "You've reached the end of the quiz.",
        ).show();

        quizBrain.reset();
        scores.clear();
      } else {
        if (quizBrain.checkAnswer(ans)) {
          scores.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scores.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }

        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      quizBrain.getQuestion(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 0, 8, 18),
                color: Colors.green,
                height: 60,
                child: TextButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    check_ans(true);
                  },
                  child: Text(
                    "True",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 0, 8, 18),
                color: Colors.red,
                height: 60,
                child: TextButton(
                  onPressed: () {
                    check_ans(false);
                  },
                  child: Text(
                    "False",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Row(
                children: scores,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
