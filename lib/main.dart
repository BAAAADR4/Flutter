import 'package:flutter/gestures.dart'; // 1. import de PointerDeviceKind
import 'package:flutter/material.dart';
import 'package:x_clone_ec/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class AppScrollBehavior extends MaterialScrollBehavior {
  // 2. la classe
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
    PointerDeviceKind.stylus,
  };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clone X',
      scrollBehavior: AppScrollBehavior(), // 3. branchée sur MaterialApp
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const LoginPage(),
    );
  }
}
