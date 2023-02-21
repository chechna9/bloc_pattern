import 'package:bloc_pattern_course/business_logic/cubits/counter_cubit/counter_cubit.dart';
import 'package:bloc_pattern_course/presentation/screens/homeScreen.dart';
import 'package:bloc_pattern_course/presentation/screens/second_Screen.dart';
import 'package:bloc_pattern_course/presentation/screens/thirdScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
            title: 'Home Page',
            color: Colors.blueAccent,
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => const SecondScreen(
            title: 'Second Screen',
            color: Colors.redAccent,
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const ThirdScreen(
            title: 'Third Screen',
            color: Colors.purpleAccent,
          ),
        );
      default:
        return null;
    }
  }
}
