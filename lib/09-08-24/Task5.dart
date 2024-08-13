import 'package:flutter/material.dart';
class SumNumbersScreen extends StatefulWidget {
  @override
  _SumNumbersScreenState createState() => _SumNumbersScreenState();
}

class _SumNumbersScreenState extends State<SumNumbersScreen> {
  final TextEditingController _controller = TextEditingController();
  int _sum = 0;
  int recursiveSum(List<int> nums, int index) {
    if (index >= nums.length) {
      return 0;
    }
    return nums[index] + recursiveSum(nums, index + 1);
  }

  void _calculateSum() {
    List<int> numbers = _controller.text.split(',')
        .map((e) => int.tryParse(e.trim()) ?? 0).toList();
    setState(() {
      _sum = recursiveSum(numbers, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(child: Text('Recursive Sum',style: TextStyle(color: Colors.white),)),
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
              onPressed: _calculateSum,
              style: ElevatedButton.styleFrom(primary: Colors.purple),
              child: Text('Calculate Sum',style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 16),
            Text(
              'Sum: $_sum',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
