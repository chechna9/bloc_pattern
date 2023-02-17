import 'package:bloc_pattern_course/business_logic/cubits/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('counter cubit', () {
    CounterCubit? counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit!.close();
    });
    test('the initial state of CounterCubit is CounterState(initialvalue:0)',
        () {
      expect(counterCubit!.state,
          CounterState(counterValue: 0, wasIncremented: false));
    });
    // test from bloc_test
    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a counterState(counterValue:1,wasIncremented:true) when cubit.increment() is called',
      build: () => counterCubit!,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );
    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a counterState(counterValue:-1,wasIncremented:false) when cubit.decrementd() is called',
      build: () => counterCubit!,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
