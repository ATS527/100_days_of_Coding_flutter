import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final quizControllerProvider = ChangeNotifierProvider<QuizController>((ref) {
  return QuizController();
});

class QuizController extends ChangeNotifier {
  // ignore: prefer_final_fields
  int questionIndex = 0;
  bool resultPage = false;
  int totalScore = 0;

  String getQuestion() {
    return data[questionIndex]["questionText"] as String;
  }

  void resetQuiz() {
    questionIndex = 0;
    resultPage = false;
    totalScore = 0;
    notifyListeners();
  }

  void checkAnswer(Map<String, Object> item) {
    totalScore += item["score"] as int;
    if (questionIndex < data.length - 1) {
      questionIndex++;
    } else if (questionIndex == data.length - 1) {
      resultPage = true;
    }
    notifyListeners();
  }

  final List<Map<String, Object>> data = [
    {
      "questionText": "What is your favourite Pet?",
      "options": [
        {"text": "Dog", "score": 19},
        {"text": "Cat", "score": 11},
        {"text": "Monkey", "score": 1},
        {"text": "Donkey", "score": 4}
      ],
    },
    {
      "questionText": "What is your favourite Food?",
      "options": [
        {"text": "Poori", "score": 20},
        {"text": "Vada", "score": 30},
        {"text": "Dosa", "score": 10},
        {"text": "Pizza", "score": 1}
      ],
    },
    {
      "questionText": "What is your favourite animal?",
      "options": [
        {"text": "Cheetah", "score": 100},
        {"text": "Lion", "score": 20},
        {"text": "King Kong", "score": 89},
        {"text": "Godzilla", "score": 99}
      ],
    },
    {
      "questionText": "What is your favourite Subject?",
      "options": [
        {"text": "PC", "score": 98},
        {"text": "EG", "score": 56},
        {"text": "Maths", "score": 45},
        {"text": "Physics", "score": 34}
      ],
    },
    {
      "questionText": "What is your favourite wonders of world?",
      "options": [
        {"text": "Taj Mahal", "score": 101},
        {"text": "Pyramids", "score": 99},
        {"text": "Stone Hedge", "score": 999},
        {"text": "Niagra", "score": 101}
      ],
    },
    {
      "questionText": "What is your favourite phone brand?",
      "options": [
        {"text": "Samsung", "score": 100},
        {"text": "Apple", "score": 99},
        {"text": "Xiaomi", "score": 10},
        {"text": "Realme", "score": 10}
      ],
    }
  ];
}
