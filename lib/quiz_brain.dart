import 'package:fluttertoast/fluttertoast.dart';

import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  int _rightAnswersCount = 0;
  int _wrongAnswersCount = 0;

  static List<Question> _questionBank = [
    Question('Some cats are actually allergic to humans', Answer.maybe),
    Question('You can lead a cow down stairs but not up stairs.', Answer.maybe),
    Question('Approximately one quarter of human bones are in the feet.',
        Answer.positive),
    Question('A slug\'s blood is green.', Answer.positive),
    Question(
        'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', Answer.maybe),
    Question('It is illegal to pee in the Ocean in Portugal.', Answer.positive),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        Answer.negative),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        Answer.positive),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        Answer.negative),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        Answer.maybe),
    Question('Google was originally called \"Backrub\".', Answer.positive),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        Answer.positive),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        Answer.maybe),
  ];

  final int _lastQuestionIndex = _questionBank.length - 1;

  bool _questionIsTheLast() {
    return _questionNumber <= _lastQuestionIndex &&
        _questionNumber == _lastQuestionIndex;
  }

  bool _questionIsNotTheLast() => !_questionIsTheLast();

  bool _questionDoesNotExist() => _questionNumber > _lastQuestionIndex;

  void _nextQuestion() {
    if (_questionIsNotTheLast()) {
      _questionNumber++;
    }
  }

  void rightAnswer() {
    _rightAnswersCount++;

    _nextQuestion();
  }

  void wrongAnswer() {
    _wrongAnswersCount++;

    _nextQuestion();
  }

  String getScore() {
    double percentual;

    if (_questionNumber == 0) {
      percentual = 0;
    } else {
      percentual = _rightAnswersCount / _questionNumber * 100;
    }

    return percentual.toStringAsFixed(2) + '%';
  }

  String getFinalScore() {
    double percentual = (_rightAnswersCount / _questionBank.length) * 100;

    return percentual.toStringAsFixed(2) + '%';
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  Answer getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionIsTheLast() || _questionDoesNotExist()) {
      return true;
    } else {
      return false;
    }
  }

  bool isNotFinished() => !isFinished();

  void reset() {
    Fluttertoast.showToast(
        msg: "The End! Your score: " + getFinalScore(),
        toastLength: Toast.LENGTH_LONG);
    _questionNumber = 0;

    _rightAnswersCount = 0;
    _wrongAnswersCount = 0;
  }
}
