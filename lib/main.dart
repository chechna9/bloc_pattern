import 'package:bloc_pattern_course/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with Bloc'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterCubit, CounterState>(
            listener: (context, state) {
              if (state.wasIncremented) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Incremented')),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('decremented')),
                );
              }
            },
            builder: (context, state) {
              return Text(
                context.read<CounterCubit>().state.counterValue.toString(),
                style: Theme.of(context).textTheme.displayMedium,
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  // context.read<CounterCubit>().increment();
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
