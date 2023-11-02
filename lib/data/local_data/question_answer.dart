import '../../pages/home_screen.dart';
import '../../pages/question_model.dart';

class Question {
  int katarNomeri = 0;
  List<QuestionModel> suroolorJooptor = [
    QuestionModel(
      suroolor: ' Kyrgyzstan located in Europa',
      jooptor: Jooptor.falsch,
    ),
    QuestionModel(
      suroolor: 'Talas is capital of Kyrgyzstan',
      jooptor: Jooptor.falsch,
    ),
    QuestionModel(
      suroolor: 'Osh is second capital of Kyrgyzstan',
      jooptor: Jooptor.richrig,
    ),
    QuestionModel(
      suroolor: ' Kyrgyzstan located in Central Asia',
      jooptor: Jooptor.richrig,
    ),
    QuestionModel(
      suroolor: 'Kyrgyzstan bordered with 5 another country',
      jooptor: Jooptor.falsch,
    ),
    QuestionModel(
      suroolor: 'Batken is most beatiful region in Kyrgyzstan',
      jooptor: Jooptor.richrig,
    ),
    QuestionModel(
      suroolor: 'Kyrgyzstan has 7 region',
      jooptor: Jooptor.richrig,
    ),
    QuestionModel(
      suroolor: 'Kyrgyzstan most beautiful country on the world',
      jooptor: Jooptor.richrig,
    ),
    QuestionModel(
      suroolor: 'Bishkek is capital of Kyrgyzstan',
      jooptor: Jooptor.richrig,
    ),
  ];
  String? getQuestion() {
    if (katarNomeri < Question().suroolorJooptor.length) {
      return Question().suroolorJooptor[katarNomeri].suroolor;
    } else {
      return '';
    }
  }

  Jooptor? getAnswer() {
    if (katarNomeri < Question().suroolorJooptor.length) {
      return Question().suroolorJooptor[katarNomeri].jooptor;
    }
  }

  void skip() {
    katarNomeri = katarNomeri + 1;
  }

  void kairaBashta() {
    katarNomeri = 0;
  }
}

final Question question = Question();
