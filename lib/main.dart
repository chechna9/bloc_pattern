import 'package:flutter/material.dart';

import 'package:bloc_pattern_course/business_logic/cubits/counter_cubit/counter_cubit.dart';
import 'package:bloc_pattern_course/business_logic/cubits/internet_cubit/cubit/cubit/internet_cubit.dart';
import 'package:bloc_pattern_course/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
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
