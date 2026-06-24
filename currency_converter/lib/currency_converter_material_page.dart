//import 'dart:ffi';

//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});

  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState
    extends State<CurrencyConverterMaterialPage> {
  double finalResult = 0;
  final TextEditingController textEditingController = TextEditingController();

  // @override
  // initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      // Color(0xAARRGGBB)
      // 0xFF000000
      borderSide: BorderSide(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.circular(10),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: const Text(
          'Currency Converter',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'INR $finalResult',
              style: const TextStyle(
                fontSize: 55,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: textEditingController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  // label:Text(
                  //   "Please Enter The Amound In USD.",
                  //   style:TextStyle(
                  //     color:Colors.white
                  //   ))
                  hintText: "Please Enter the Amount in USD.",
                  hintStyle: const TextStyle(color: Colors.black),
                  prefixIcon: const Icon(Icons.monetization_on_outlined),
                  prefixIconColor: Colors.black,
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double result = double.parse((textEditingController.text)) * 94.33;
                  finalResult = double.parse(result.toStringAsFixed(3));
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            
              // Another Ways ⬇
            
              // style: ButtonStyle(
              //   backgroundColor: const WidgetStatePropertyAll(Colors.black),
              //   foregroundColor: const WidgetStatePropertyAll(Colors.white),
              //   fixedSize: const WidgetStatePropertyAll(Size(410, 50)),
              //   minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 50)),
              //   shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10)
              //   ))
              // ),
              child: const Text("Convert"),
            ),
          ],
        ),
      ),
    );
  }
}
