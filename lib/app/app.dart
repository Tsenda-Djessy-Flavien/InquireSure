import 'package:analyse_gp/presentation/onboarding.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(useMaterial3: true),
      title: "InquireSure",
      home: const OnBoarding(),
    );
  }
}
