import 'package:flutter/material.dart';
class answered1 extends StatelessWidget {
  const answered1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question", style: TextStyle(
          fontSize: 23.04, // Approximately 23.04px from a 16pt font at 1.44x scale
          fontWeight: FontWeight.bold,
          fontFamily: 'Raleway', // Assuming Raleway, adjust if different
          color: Colors.black,
        ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0), // Increased right padding for search icon
            child: Icon(Icons.search, color: Color(0xff339D44), size: 24), // Adjusted size if needed
          ),
        ],),
    );
  }
}
