import 'package:flutter/material.dart';
import 'package:quiz_app/controllers/quiz_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuizPage extends ConsumerWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _quizController = ref.watch(quizControllerProvider);
    print("Build Called");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Page"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              _quizController.getQuestion(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 80),
            ...(_quizController.data[_quizController.questionIndex]["options"]
                    as List<Map<String, Object>>)
                .map(
                  (item) => ElevatedButton(
                    onPressed: () {
                      _quizController.checkAnswer(item);
                    },
                    child: Text(item["text"] as String),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}
