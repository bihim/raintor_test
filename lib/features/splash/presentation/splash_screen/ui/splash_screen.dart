import 'package:flutter/material.dart';
import 'package:raintor_test/features/splash/presentation/splash_screen/ui/widgets/splash_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
