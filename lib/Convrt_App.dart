import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CurrencyConverter(),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
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
        title: Text('Currency Converter (USD to PKR)'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.purpleAccent,
              Colors.orangeAccent,
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
              Text(
                'USD',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _usdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter amount in USD',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertCurrency,
                child: Text('Convert'),
              ),
              SizedBox(height: 20),
              Text(
                'Result (PKR)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _resultController,
                readOnly: true, // Prevent editing the result field
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Converted amount will appear here',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  _usdController.clear();
                  _resultController.clear();
                },
                child: Text('Clear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}