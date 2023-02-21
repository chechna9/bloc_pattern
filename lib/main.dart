import 'package:bloc_pattern_course/business_logic/cubits/counter_cubit/counter_cubit.dart';
import 'package:bloc_pattern_course/business_logic/cubits/internet_cubit/cubit/cubit/internet_cubit.dart';
import 'package:bloc_pattern_course/presentation/router/app_router.dart';
import 'package:bloc_pattern_course/presentation/screens/homeScreen.dart';
import 'package:bloc_pattern_course/presentation/screens/second_Screen.dart';
import 'package:bloc_pattern_course/presentation/screens/thirdScreen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  MyApp({super.key, required this.appRouter, required this.connectivity});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
