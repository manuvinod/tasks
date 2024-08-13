import 'package:flutter/material.dart';

class PersonScreen extends StatefulWidget {
  @override
  _PersonScreenState createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String _personDetails = '';

  void _createPerson() {
    setState(() {
      String name = _nameController.text;
      int age = int.parse(_ageController.text);
      Person person = Person(name: name, age: age);
      _personDetails = person.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Person'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter age',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createPerson,
              child: Text('Create Person'),
            ),
            SizedBox(height: 16),
            Text(
              _personDetails,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
class Person {
  String name;
  int age;

  Person({required this.name, required this.age});
  String toString() {
    return 'Name: $name, Age: $age';
  }
}
