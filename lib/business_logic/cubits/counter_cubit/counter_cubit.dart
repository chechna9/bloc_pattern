import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_course/business_logic/cubits/internet_cubit/cubit/cubit/internet_cubit.dart';
import 'package:bloc_pattern_course/constants/enums.dart';
import 'package:equatable/equatable.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}
