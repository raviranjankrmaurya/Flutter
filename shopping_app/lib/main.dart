
import 'package:flutter/material.dart';

import 'package:shopping_app/cart_provider.dart';
import 'package:shopping_app/home_page.dart';
import 'package:provider/provider.dart';

// flutter run -d web-server --web-hostname 0.0.0.0 --web-port 3000

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CartProvider())],
      child: MaterialApp(
        title: 'Shopping',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Lato',
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromRGBO(254, 206, 1, 1),
                primary: Color.fromRGBO(254, 206, 1, 1)),
            inputDecorationTheme: const InputDecorationTheme(
                hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                prefixIconColor: Color.fromRGBO(119, 119, 119, 1)),
            textTheme: const TextTheme(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 35, height: 1.2),
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              bodySmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            useMaterial3: true),
        home: const HomePage(),
      ),
    );
  }
}
