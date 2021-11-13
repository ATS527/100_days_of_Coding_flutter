import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterController extends ChangeNotifier{
  int _counter = 0;
  int get counter => _counter;

  void increment () {
    _counter++;
    notifyListeners();
  }
}

final counterControllerProvider = ChangeNotifierProvider<CounterController>((ref) {
  return CounterController();
});