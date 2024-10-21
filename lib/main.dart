import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_ai/src/features/home/cubit/home_cubit.dart';
import 'package:gemini_ai/src/features/splash/cubit/splash_cubit.dart';
import 'package:gemini_ai/src/features/splash/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()..init()),
        BlocProvider(create: (context) => HomeCubit("AIzaSyC2DfghwsT2mq8ME5QQkAk6Gva4HZlRvDo")),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
        home: const Splash(),
      ),
    );
  }
}
