import 'package:flutter/material.dart';

class ReverseString extends StatefulWidget {
  const ReverseString({super.key});

  @override
  State<ReverseString> createState() => _ReverseStringState();
}

class _ReverseStringState extends State<ReverseString> {
  final TextEditingController reversController=TextEditingController();
  String _reverseString="";
  String reverseString(String str){
    return str.split("").reversed.join("");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Center(child: Text("Revers",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          const Text("Reverse The Word",style: TextStyle(color: Colors.purple,fontSize: 25),textAlign: TextAlign.center,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: reversController,
              decoration: InputDecoration(
                hintText: "Enter a text",
                border: OutlineInputBorder()
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
            _reverseString=reverseString(reversController.text);
            });
          }, child: Text("Revers")),
          SizedBox(height: 30,),
          Text("Reversed Text: '$_reverseString'",style: TextStyle(fontSize: 20),textAlign:TextAlign.center,)
        ],
      ),
    );
  }
}
