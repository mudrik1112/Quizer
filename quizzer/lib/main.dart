import 'package:flutter/material.dart';
import 'package:quizzer/data/question_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color mainColor = Colors.blueGrey.shade400;
  Color secondColor = Colors.grey.shade400;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: PageView.builder(
          itemCount: questions.length,
          itemBuilder:  (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text("Question ${index + 1} /${questions.length}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 28.0,
                  ),
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 8.0,
                  thickness: 1.0,
                ),
                const SizedBox(height: 20,),
                Text(questions[index].question!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                ),
                ),
                const SizedBox(height: 20,),

                for(int i = 0; i < questions[index].answer!.length; i++)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: MaterialButton(
                    shape: const StadiumBorder(),
                    color: secondColor,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    onPressed: (){},
                    child: Text(questions[index].answer!.keys.toList()[i],
                    style: const TextStyle(
                      color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                OutlinedButton(
                  onPressed: (){},
                  style: ButtonStyle(),
                  child: const Text("NEXT",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}