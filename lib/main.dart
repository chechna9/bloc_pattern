import 'package:bloc_pattern_course/business_logic/cubits/cubit/counter_cubit.dart';
import 'package:bloc_pattern_course/presentation/router/app_router.dart';
import 'package:bloc_pattern_course/presentation/screens/homeScreen.dart';
import 'package:bloc_pattern_course/presentation/screens/second_Screen.dart';
import 'package:bloc_pattern_course/presentation/screens/thirdScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
