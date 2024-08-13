import 'package:flutter/material.dart';

class square extends StatefulWidget {
  const square({super.key});

  @override
  State<square> createState() => _squareState();
}

class _squareState extends State<square> {
  final TextEditingController controller=TextEditingController();
  List<int> SquaredNumbers=[];
  List<int>SquareList(List<int>nums){
    return nums.map((num) => num*num).toList();
  }
  void _squareNumbers(){
    List<int>numbers=controller.text.split(",").map((e) => int.tryParse(e.trim())??0).toList();
    setState(() {
      SquaredNumbers=SquareList(numbers);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(child: Text("Sqaure",style: TextStyle(color: Colors.white),)),
      ),
      body: Column(
        children: [
          SizedBox(height: 200,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter the numbers",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(onPressed: _squareNumbers,
              style: ElevatedButton.styleFrom(primary: Colors.purple),
              child: Text("square",style: TextStyle(color: Colors.white),)),
          SizedBox(height: 20,),
          Text("Squared Numbers:"),
          Expanded(
            child: ListView.builder(
                itemCount: SquaredNumbers.length,
                itemBuilder: (context,index){
              return ListTile(
                title: Text("${SquaredNumbers[index]}"),
              );
            }),
          )

        ],
      ),
    );
  }
}
