import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter.bloc.dart';
import '../widgets/appBar.widget.dart';
import '../widgets/counter.button.widget.dart';
import '../widgets/drawer.widget.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const appBarWidgets(title: "Counter"),
      drawer: const drawerWidget(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  "Counter value => ${state.counter}",
                  style: Theme.of(context).textTheme.bodyLarge,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: counterButtonWidget(
        onIncrement:
            () => context.read<CounterBloc>().add(IncrementCounterEvent()),
        onDecrement:
            () => context.read<CounterBloc>().add(DecrementCounterEvent()),
      ),
    );
  }
}
