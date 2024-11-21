import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: CurrencyConverter(),
//     );
//   }
// }

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _usdController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();
  final double exchangeRate = 283.50; // Example rate of 1 USD = 283.50 PKR

  void _convertCurrency() {
    setState(() {
      double usdAmount = double.tryParse(_usdController.text) ?? 0;
      double convertedAmount = usdAmount * exchangeRate;
      _resultController.text = convertedAmount.toStringAsFixed(2); // Show result in the result TextFormField
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter (USD to PKR)'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.green,
              Colors.greenAccent,
              Colors.black26,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'USD',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _usdController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter amount in USD',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertCurrency,
                child: const Text('Convert'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Result (PKR)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _resultController,
                readOnly: true, // Prevent editing the result field
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Converted amount will appear here',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  _usdController.clear();
                  _resultController.clear();
                },
                child: const Text('Clear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}