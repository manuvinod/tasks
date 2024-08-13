import 'package:flutter/material.dart';

class Even extends StatefulWidget {
  const Even({super.key});

  @override
  State<Even> createState() => _EvenState();
}

class _EvenState extends State<Even> {
  final TextEditingController numberController=TextEditingController();
  List<int> _EvenNumbers=[];
  List<int> filtErevens(List<int>nums){
    return nums.where((num) => num % 2==0).toList();
  }
  void _filterNumbers(){
    setState(() {
      List<int>numbers=numberController.text.split(",").map((e) => int.tryParse(e.trim())??0).toList();
      _EvenNumbers=filtErevens(numbers);
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title:Center(child: Text("EvenNumber",style: TextStyle(color: Colors.white),)),
      ),
      body: Column(
        children: [
          TextField(
            controller: numberController,
            decoration: InputDecoration(
               hintText: "Enter the numbers",
              border: OutlineInputBorder()
            ),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 30,),
          ElevatedButton(onPressed:_filterNumbers, child: Text("Filter")),
          Expanded(
            child: ListView.builder(
                itemCount: _EvenNumbers.length,
                itemBuilder: (context, index){
              return ListTile(
                title: Text(_EvenNumbers[index].toString()),
              );
            }),
          )
        ],
      ),
    );
  }
}
