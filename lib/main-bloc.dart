import 'package:bloc/bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on((event, emit) {
      switch (event) {
        case CounterEvent.increment:
          return emit(state + 1);

        case CounterEvent.decrement:
          return emit(state - 1);
      }
    });
  }

  Stream<int> mapEventToState(CounterEvent event) async* {}
}

Future<void> main() async {
  final bloc = CounterBloc();
  final streamSubscription = bloc.stream.listen(print);
  bloc.add(CounterEvent.increment);
  bloc.add(CounterEvent.increment);
  bloc.add(CounterEvent.decrement);

  await Future.delayed(const Duration(seconds: 1));
  await streamSubscription.cancel();
  await bloc.close();
}
