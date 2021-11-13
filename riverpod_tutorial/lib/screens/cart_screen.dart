import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_tutorial/controller/counter_controller.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _counterController = watch(counterControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Screen"),
      ),
      body: Center(
        child: Text("Counter : ${_counterController.counter}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counterController.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
