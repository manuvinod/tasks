import 'package:flutter/material.dart';
class MaxMinScreen extends StatefulWidget {
  @override
  _MaxMinScreenState createState() => _MaxMinScreenState();
}

class _MaxMinScreenState extends State<MaxMinScreen> {
  final TextEditingController _controller = TextEditingController();
  int _max = 0;
  int _min = 0;
  List<int> findMaxMin(List<int> nums) {
    if (nums.isEmpty) {
      return [0, 0];
    }
    int max = nums[0];
    int min = nums[0];

    for (int num in nums) {
      if (num > max) {
        max = num;
      }
      if (num < min) {
        min = num;
      }
    }
    return [max, min];
  }

  void _calculateMaxMin() {
    List<int> numbers = _controller.text.split(',')
        .map((e) => int.tryParse(e.trim()) ?? 0).toList();
    List<int> maxMin = findMaxMin(numbers);
    setState(() {
      _max = maxMin[0];
      _min = maxMin[1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Max and Min'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter numbers separated by commas',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateMaxMin,
              child: Text('Find Max and Min'),
            ),
            SizedBox(height: 16),
            Text(
              'Max: $_max',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Min: $_min',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
