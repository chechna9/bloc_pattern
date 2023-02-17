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

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
