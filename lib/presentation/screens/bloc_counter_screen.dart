import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CounterBloc(),
        child: const _BlocCounterView());
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void icreaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().increaseBy(value);
  }

  void resetCounter(BuildContext context, [value = 0]) {
    context.read<CounterBloc>().resetCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc counterBloc) {
          return Text('Bloc Counter: ${counterBloc.state.transactionCounter}');
        }),
        actions: [
          IconButton(
              onPressed: () => resetCounter(context),
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(child: context.select((CounterBloc counterBloc) {
        return Text('Counter value: ${counterBloc.state.counter}');
      })),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => icreaseCounterBy(context, 3),
            heroTag: '1',
            child: const Text('+3'),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () => icreaseCounterBy(context, 2),
            heroTag: '2',
            child: const Text('+2'),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () => icreaseCounterBy(context, 1),
            heroTag: '3',
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
