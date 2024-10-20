import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of questions and answers
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Quelle est la capitale de la France ?',
      'answers': ['Paris', 'Londres', 'Berlin', 'Madrid'],
      'correctAnswer': 'Paris'
    },
    {
      'questionText': 'Quelle est la plus grande planète du système solaire ?',
      'answers': ['Mars', 'Jupiter', 'Saturne', 'Terre'],
      'correctAnswer': 'Jupiter'
    },
    {
      'questionText': 'Qui a écrit "Les Misérables" ?',
      'answers': ['Victor Hugo', 'Charles Dickens', 'Jules Verne', 'Molière'],
      'correctAnswer': 'Victor Hugo'
    },
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _quizCompleted = false;

  // Function to check the answer and move to the next question
  void _answerQuestion(String selectedAnswer) {
    if (_questions[_currentQuestionIndex]['correctAnswer'] == selectedAnswer) {
      _score++;
    }

    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _quizCompleted = true;
      }
    });
  }

  // Function to restart the quiz
  void _resetQuiz() {
    setState(() {
      _currentQuestionIndex = 0;
      _score = 0;
      _quizCompleted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFEC6DB1), // Blue background
        ),
        padding: const EdgeInsets.all(16.0), // Add padding to the content
        child: Center(
          child: _quizCompleted
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Quiz Terminé! Votre score: $_score/${_questions.length}',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _resetQuiz,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      ),
                      child: const Text('Recommencer'),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _questions[_currentQuestionIndex]['questionText'] as String,
                      style: const TextStyle(fontSize: 22, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    // Map over the list of answers and create buttons
                    ...(_questions[_currentQuestionIndex]['answers'] as List<String>)
                        .map((answer) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: ElevatedButton(
                                onPressed: () => _answerQuestion(answer),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                                ),
                                child: Text(answer),
                              ),
                            ))
                        .toList(),
                  ],
                ),
        ),
      ),
    );
  }
}
