import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  //* hive
  await Hive.initFlutter();
  //* open boxconst HomePage(),
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
        splash: Icons.add_sharp,
        duration: 5000,
        backgroundColor: Color.fromARGB(255, 247, 247, 108),
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: const HomePage(),
      ),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
