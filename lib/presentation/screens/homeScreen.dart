import 'package:bloc_pattern_course/business_logic/cubits/counter_cubit/counter_cubit.dart';
import 'package:bloc_pattern_course/business_logic/cubits/internet_cubit/cubit/cubit/internet_cubit.dart';
import 'package:bloc_pattern_course/constants/enums.dart';
import 'package:bloc_pattern_course/presentation/screens/second_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final String title;
  final Color color;
  const HomeScreen({
    super.key,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.wifi) {
          context.read<CounterCubit>().increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.mobile) {
          context.read<CounterCubit>().decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return Text(
                    'Wifi',
                    style: Theme.of(context).textTheme.headlineLarge,
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobile) {
                  return Text(
                    'Mobile',
                    style: Theme.of(context).textTheme.headlineLarge,
                  );
                } else if (state is InternetDisconnected) {
                  return Text(
                    'Disconnted',
                    style: Theme.of(context).textTheme.headlineLarge,
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
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
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              color: Colors.redAccent,
              child: const Text(
                'Go to Second Screen',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              color: Colors.purpleAccent,
              child: const Text(
                'Go to Third Screen',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
