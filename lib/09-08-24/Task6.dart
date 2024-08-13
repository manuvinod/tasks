import 'package:flutter/material.dart';
class IntersectionScreen extends StatefulWidget {
  @override
  _IntersectionScreenState createState() => _IntersectionScreenState();
}

class _IntersectionScreenState extends State<IntersectionScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  Set<int> _intersection = {};

  Set<int> intersectSets(Set<int> set1, Set<int> set2) {
    return set1.intersection(set2);
  }

  void _findIntersection() {
    Set<int> set1 = _controller1.text.split(',')
        .map((e) => int.tryParse(e.trim()) ?? 0).toSet();
    Set<int> set2 = _controller2.text.split(',')
        .map((e) => int.tryParse(e.trim()) ?? 0).toSet();

    setState(() {
      _intersection = intersectSets(set1, set2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intersection of Sets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter first set of numbers',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter second set of numbers',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _findIntersection,
              child: Text('Find Intersection'),
            ),
            SizedBox(height: 16),
            Text(
              'Intersection: ${_intersection.join(', ')}',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
