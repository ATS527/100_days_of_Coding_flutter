import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/controllers/quiz_controller.dart';

import 'screens/quiz_page.dart';
import 'screens/result_page.dart';

void main(List<String> args) {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizController = ref.watch(quizControllerProvider);
    return MaterialApp(
      home: quizController.resultPage ? const ResultPage() : const QuizPage(),
    );
  }
}
