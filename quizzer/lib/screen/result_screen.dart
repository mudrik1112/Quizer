import 'package:flutter/material.dart';
import 'package:quizzer/main.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score,{super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
  Color mainColor = Colors.blueGrey.shade400;
  Color secondColor = Colors.grey.shade400;
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Quiz Result :",
            style: TextStyle(
              color: Colors.white,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 50.0),
            Text("${widget.score}",
            style: TextStyle(color: Colors.yellow,
            fontSize: 70.0,
            fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 50,),
            MaterialButton(
              
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              elevation: 0.0,
              color: Colors.yellow,
              textColor: Colors.white,
              child: Text("Take Quiz Again"),

            ),
          ],
        ),
      ),
    );
  }
}