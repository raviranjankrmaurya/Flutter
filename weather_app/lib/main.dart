import 'package:flutter/material.dart';
import 'package:weather_app/weather_main_page.dart';

// flutter run -d web-server --web-hostname 0.0.0.0 --web-port 3000

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: WeatherMainPage(),
    );
  }
}
