enum Answer { positive, negative, maybe }

class Question {
  String questionText;
  Answer questionAnswer;

  Question(this.questionText, this.questionAnswer);
}
