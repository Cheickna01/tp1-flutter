import 'package:flutter/material.dart';

import '../widgets/appBar.widget.dart';
import '../widgets/counter.button.widget.dart';
import '../widgets/drawer.widget.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const appBarWidgets(title: "Counter"),
      drawer: const drawerWidget(),
      body: Center(
        child: Text(
          "Counter value => $counter",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      floatingActionButton: counterButtonWidget(
        counter: counter,
        onIncrement: incrementCounter,
        onDecrement: decrementCounter,
      ),
    );
  }
}
