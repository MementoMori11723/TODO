import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Lottie.network(
          'https://assets1.lottiefiles.com/packages/lf20_spnbgchy.json',
          height: 70,
          repeat: true,
          fit: BoxFit.cover,
        ),
        const Text(
          "TO DO",
          style: TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}
