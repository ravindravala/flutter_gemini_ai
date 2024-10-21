import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_ai/src/features/home/view/home.dart';
import 'package:gemini_ai/src/features/splash/cubit/splash_cubit.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is NavigateToHome) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
        }
      },
      child: const Scaffold(
        backgroundColor: Colors.black87,
        body: Center(
          child: CupertinoActivityIndicator(color: Colors.white,),
        ),
      ),
    );
  }
}
