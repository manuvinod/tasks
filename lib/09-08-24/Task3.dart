import 'package:flutter/material.dart';

class CharCountApp extends StatefulWidget {
  const CharCountApp({super.key});

  @override
  State<CharCountApp> createState() => _CharCountAppState();
}

class _CharCountAppState extends State<CharCountApp> {
  final TextEditingController _controller = TextEditingController();
  Map<String, int> _charCounts = {};

  void _countCharacters() {
    setState(() {
      _charCounts = charCount(_controller.text);
    });
  }

  Map<String, int> charCount(String str) {
    Map<String, int> countMap = {};

    for (var char in str.split('')) {
      if (countMap.containsKey(char)) {
        countMap[char] = countMap[char]! + 1;
      } else {
        countMap[char] = 1;
      }
    }

    return countMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Center(
          child: Text(
            "Character Count",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Enter a string",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _countCharacters,
              child: const Text("Count Characters",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _charCounts.length,
                itemBuilder: (context, index) {
                  String key = _charCounts.keys.elementAt(index);
                  int value = _charCounts[key]!;
                  return ListTile(
                    title: Text('$key: $value'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
