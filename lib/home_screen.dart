import 'package:flutter/material.dart';
import 'package:quizzler/question_lib/question_library.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<bool> answerList = [];
  final library = QuestionLibrary();

  void checkAnswer(bool selectedAnswer){
    setState(() {
      if(library.isFinished())
        {
          Alert(
            context: context,
            title: 'FIM',
            desc: 'Parabéns, você chegou ao final!',
            buttons: [
              DialogButton(
                child: Text('DE NOVO'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              )
            ]
          ).show();
          library.reset();
          answerList = [];
        }
      else{
        print('Selected : $selectedAnswer, correct: ${library.getAnswer()}');
        answerList.add(selectedAnswer == library.getAnswer());
      }
    });
    library.nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,),
              child: Center(
                child: Text(
                  library.getQuestion(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: RaisedButton(
              color: Colors.green,
              onPressed: (){
                checkAnswer(true);
              },
              child: Text(
                'Verdadeiro'
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: RaisedButton(
              color: Colors.red,
              onPressed: (){
                checkAnswer(false);
              },
              child: Text(
                'Falso'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              child: Row(
                children:[
                  Text(
                    'Pontuação',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11
                    ),
                  ),
                  Icon(
                    Icons.play_arrow,
                    color: Colors.lightBlue,
                  ),
                  for(bool item in answerList)
                    Icon(
                      item ? Icons.check : Icons.close,
                      color: item ? Colors.green : Colors.red,
                    )
                ]
              ),
            ),
          ),
        ]
      )
    );
  }
}
