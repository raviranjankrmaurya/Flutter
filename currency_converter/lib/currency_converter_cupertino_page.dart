import 'package:flutter/cupertino.dart';

class CurrencyConverterCupertinoPage extends StatefulWidget {
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State<CurrencyConverterCupertinoPage> createState() =>
      _CurrencyConverterCupertinoPageState();
}

class _CurrencyConverterCupertinoPageState
    extends State<CurrencyConverterCupertinoPage> {
  double finalResult = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle: const Text(
          'Currency Converter',
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      child: Center(
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
              child: CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(color: CupertinoColors.black),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                placeholder: 'Please enter the amount in USD',
                prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
            ),

            const SizedBox(height: 10),

            CupertinoButton(
              onPressed: () {
                setState(() {
                  double result =
                      double.parse((textEditingController.text)) * 94.33;
                  finalResult = double.parse(result.toStringAsFixed(3));
                });
              },
              color: CupertinoColors.black,
              foregroundColor: CupertinoColors.white,
              minimumSize: const Size(double.infinity, 50),

              borderRadius: BorderRadius.circular(5),

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
