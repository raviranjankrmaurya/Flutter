import 'package:flutter/material.dart';
import 'package:ravixo/colors.dart';
import 'package:ravixo/responsive/responsive_layout.dart';
import 'package:ravixo/screens/mobile_screen.dart';
import 'package:ravixo/screens/web_screen.dart';

void main() {
  runApp(const MyApp());
}

// flutter run -d web-server --web-hostname 0.0.0.0 --web-port 3000
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ravixo",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: ResponsiveLayout(
        mobileScreenLayout: MobileScreen(),
        webScreenLayout: WebScreen(),
      ),
    );
  }
}
