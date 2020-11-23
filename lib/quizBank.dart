
import 'package:QuizBox/question.dart';
class Quizbrain {
  int _questionIndex = 0;

  List<Question> _questions = [
    Question('Salah is a name of cyclist', false),
    Question('Lead United is a name of a football club.', true),
    Question('Anfied is the home of Arsenal FC.', false),
    Question('Steven Gerrard win the Champions League with Barca', false),
    Question("Barca won the UEFA Champions League in 2017", false),
    Question('The Olympic rings has five colours.', true),
    Question(
        'Florence Griffith-Joyner holds the  women record for 100m sprint .',
        true),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),

        Question(
            'Au on the Periodic Table refers to gold', false,
        ),

         Question(
          "The Doppler effect applies to sound", false,
        ),
         Question(
          "You study Insect if you are studying entomology", true,
        ),
         Question(
          "The Cerebrum takes its name from the Greek for seahorse?", false
        ),
  ];

  bool isFinished() => _questionIndex >= _questions.length - 1;

  void nextQuestion() {
    if (!isFinished()) {
      _questionIndex++;
    }
  }

  void reset() => _questionIndex = 0;

  String getQuestion() => _questions[_questionIndex].question;

  bool getAnswer() => _questions[_questionIndex].answer;
}