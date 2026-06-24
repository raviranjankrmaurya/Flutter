import 'package:currency_converter/currency_converter_cupertino_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:currency_converter/currency_converter_material_page.dart';

//flutter run -d web-server --web-hostname 0.0.0.0 --web-port 3000
void main() {
  runApp(const MyCupertinoApp());
}

class MyApp extends StatelessWidget {
  // const Myapp({Key? key}): super(key:key);
  // or
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurrencyConverterMaterialPage(),
    );
  }
}

class MyCupertinoApp extends StatelessWidget {
  const MyCupertinoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home:CurrencyConverterCupertinoPage(
        
      ),
    );
  }
}
