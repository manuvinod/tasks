import 'package:flutter/material.dart';
class DivisionScreen extends StatefulWidget {
  @override
  _DivisionScreenState createState() => _DivisionScreenState();
}
class _DivisionScreenState extends State<DivisionScreen> {
  final TextEditingController _numeratorController = TextEditingController();
  final TextEditingController _denominatorController = TextEditingController();
  String _resultMessage = '';
  double? divide(int a, int b) {
    try {
      if (b == 0) {
        throw Exception('Cannot divide by zero.');
      }
      return a / b;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  void _performDivision() {
    String numeratorText = _numeratorController.text.trim();
    String denominatorText = _denominatorController.text.trim();

    if (numeratorText.isEmpty || denominatorText.isEmpty) {
      setState(() {
        _resultMessage = 'Please enter both numbers.';
      });
      return;
    }

    int? numerator = int.tryParse(numeratorText);
    int? denominator = int.tryParse(denominatorText);

    if (numerator == null || denominator == null) {
      setState(() {
        _resultMessage = 'Please enter valid integers.';
      });
      return;
    }

    double? result = divide(numerator, denominator);

    setState(() {
      if (result != null) {
        _resultMessage = 'Result: $numerator ÷ $denominator = ${result.toStringAsFixed(2)}';
      } else {
        _resultMessage = 'Error: Cannot divide by zero.';
      }
    });
  }

  @override
  void dispose() {
    _numeratorController.dispose();
    _denominatorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Division Calculator',style: TextStyle(color: Colors.white),),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _numeratorController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter an number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _denominatorController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter a number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _performDivision,
                child: Text('Divide'),
              ),
              SizedBox(height: 16),
              Text(
                _resultMessage,
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
            ],
          ),
        ));
  }
}
