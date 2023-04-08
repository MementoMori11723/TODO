import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'splash.dart';

void main() async {
  //* hive
  await Hive.initFlutter();
  //* open boxconst HomePage(),

  // ignore: unused_local_variable
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: const SplashScreen(),
        duration: 5000,
        backgroundColor: Colors.amber,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: const HomePage(),
      ),
      theme: ThemeData(primarySwatch: Colors.amber),
    );
  }
}
