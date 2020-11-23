import 'package:QuizBox/quizBank.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Center(child: QuizBox()),
    );
  }
}

class QuizBox extends StatefulWidget {
  @override
  _QuizBoxState createState() => _QuizBoxState();
}

class _QuizBoxState extends State<QuizBox> {
  var brain = Quizbrain();
  List<Icon> scoreKeeper = [];
  void _checkAnswer() {
    if (!brain.isFinished()) {
      setState(() {
        if (brain.getAnswer()) {
          scoreKeeper.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        brain.nextQuestion();
      });
    } else {
      reset();
    }
  }

  void reset() {
    AlertDialog(
      title: Text("Quiz"),
      content: Text(" You have reached the end of the quiz"),
      actions: [
        TextButton(
            onPressed: () {
              setState(() {
                brain.reset();
                scoreKeeper.clear();
              });
              Navigator.pop(context);
            },
            child: Text("Reset"))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("QuizBrain"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
                          child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text(brain.getQuestion(), textAlign: TextAlign.center,)),
              ),
            ),
            Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => this._checkAnswer(),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => this._checkAnswer(),
            ),
          ),
        ),
         Row(
          children: scoreKeeper,
        ),
          ],
        ),
      ),
    );
  }
}
