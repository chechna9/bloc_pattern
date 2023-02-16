import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

void main() async {
  // final cubit = CounterCubit();

  // print(cubit.state);

  // cubit.increment();

  // print(cubit.state);

  // cubit.increment();

  // print(cubit.state);

  // cubit.close();

  final streamCubit = CounterCubit();
  final streamSubscription = streamCubit.stream.listen(print);
  streamCubit.increment();
  streamCubit.increment();
  streamCubit.increment();

  await Future.delayed(const Duration(seconds: 2));
}
