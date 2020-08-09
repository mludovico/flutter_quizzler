import 'package:quizzler/models/question_model.dart';

class QuestionLibrary{

  int _questionNumber = 0;

  List<QuestionModel> _questionList = [
    QuestionModel(
      'É possível transmitir coronavírus com um aperto de mão.',
      true
    ),
    QuestionModel(
      'Para lavar as mãos, é importante tirar anéis, pulseiras e acessórios.',
      true
    ),
    QuestionModel(
      'Esmaltes oferecem perigo na pandemia.',
      true
    ),
    QuestionModel(
      'Homens não devem manter barba ou bigode.',
      false
    ),
    QuestionModel(
      'O coronavírus mata mais do que a varíola.',
      false
    ),
    QuestionModel(
      'Cães e gatos podem infectar os donos.',
      false
    ),
    QuestionModel(
      'Doses altas de vitamina C matam o coronavírus.',
      false
    ),
    QuestionModel(
      'Os sintomas podem durar até 10 dias.',
      true
    ),
    QuestionModel(
      'Diabéticos são mais vulneráveis à Covid-19.',
      true
    ),
    QuestionModel(
      'Gargarejo com água quente mata o vírus.',
      false
    ),
    QuestionModel(
      'O coronavírus causa pneumonia instantânea.',
      false
    ),
    QuestionModel(
      'O vírus consegue sobreviver por dois meses no ambiente.',
      false
    ),
    QuestionModel(
      'Somente infectados devem usar máscaras.',
      true
    ),
  ];

  void nextQuestion(){
    if(_questionNumber < _questionList.length - 1)
      _questionNumber ++;
  }

  String getQuestion() => _questionList[_questionNumber].question;

  bool getAnswer() => _questionList[_questionNumber].answer;

  bool isFinished() => _questionNumber >= _questionList.length - 1;

  void reset() => _questionNumber = 0;
}