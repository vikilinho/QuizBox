class Question {
  String question;
  bool answer;

  Question(this.question, this.answer)
      : assert(question != null),
        assert(answer != null);
}