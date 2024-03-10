import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CounterCubit(),
        child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void icreaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().incrementBy(value);
  }

  void resetCounter(BuildContext context) {
    context.read<CounterCubit>().reset();
  }

  @override
  Widget build(BuildContext context) {
    // final counterState = context.watch<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) {
          return Text('Cubit Counter: ${value.state.transactionCounter}');
        }),
        actions: [
          IconButton(
              onPressed: () => resetCounter(context),
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(child: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Text('Counter value: ${state.counter}');
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocBuilder<CounterCubit, CounterState>(
            // buildWhen: (previous, current) =>
            //  current.counter != previous.counter,
            builder: (context, state) {
              return FloatingActionButton(
                onPressed: () => icreaseCounterBy(context, 3),
                heroTag: '1',
                child: const Text('+3'),
              );
            },
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
