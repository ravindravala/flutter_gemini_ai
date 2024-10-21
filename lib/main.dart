import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Import dotenv
import 'package:gemini_ai/src/core/di/di.dart'; // Import the DI file
import 'package:gemini_ai/src/features/home/presentation/cubit/home_cubit.dart';
import 'package:gemini_ai/src/features/splash/cubit/splash_cubit.dart';
import 'package:gemini_ai/src/features/splash/view/splash.dart';

void main() async {
  await dotenv.load(); 
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider<SplashCubit>(create: (context) => getIt()),
      BlocProvider<HomeCubit>(create: (context) => getIt()),
      ],
      child: MaterialApp(
        title: 'Gemini AI - Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey),
          useMaterial3: true,
        ),
        home: const Splash(),
      ),
    );
  }
}
