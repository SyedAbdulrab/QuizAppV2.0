import 'package:flutter/material.dart';
import 'package:quizz_zz/data/questions.dart';
import 'package:quizz_zz/questions_screen.dart';
import 'package:quizz_zz/results_screen.dart';
import 'package:quizz_zz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void chooseAnswers(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }
  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';

    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(chooseAnswers);
    }
    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        onRestart: restartQuiz,
        chosenAnswers: selectedAnswers,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Color.fromARGB(255, 78, 13, 151),
                  Color.fromARGB(255, 107, 15, 168),
                ])),
            child: screenWidget),
      ),
    );
  }
}
