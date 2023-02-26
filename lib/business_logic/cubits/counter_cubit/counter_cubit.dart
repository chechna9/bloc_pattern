import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_course/business_logic/cubits/internet_cubit/cubit/cubit/internet_cubit.dart';
import 'package:bloc_pattern_course/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'counter_state.dart';

// or use HydratedCubit
class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}
