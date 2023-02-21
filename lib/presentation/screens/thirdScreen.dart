import 'package:bloc_pattern_course/business_logic/cubits/counter_cubit/counter_cubit.dart';
import 'package:bloc_pattern_course/presentation/screens/second_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdScreen extends StatelessWidget {
  final String title;
  final Color color;
  const ThirdScreen({
    super.key,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
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
                heroTag: 'dec',
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                tooltip: 'Decrement',
                backgroundColor: color,
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                heroTag: 'inc',
                onPressed: () {
                  // context.read<CounterCubit>().increment();
                  BlocProvider.of<CounterCubit>(context).increment();
                },
                tooltip: 'Increment',
                backgroundColor: color,
                child: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
