import 'package:flutter/material.dart';
import 'package:quizzer/data/question_list.dart';
import 'package:quizzer/screen/result_screen.dart';

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
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isWrong = Colors.red;
  Color btnColor = Colors.grey.shade400;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller!,
          onPageChanged: (page){
            setState(() {
              isPressed = false;
            });
          },
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
                    color: isPressed
                    ? questions[index].answer!.entries.toList()[i].value
                        ? isTrue
                        : isWrong
                    :secondColor,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    onPressed: isPressed
                    ? (){}
                    : (){
                        setState(() {
                      isPressed = true;
                        });
                      if(questions[index]
                      .answer!
                      .entries
                      .toList()[i]
                      .value){
                        score += 10;
                        print(score);
                      }
                    },
                    child: Text(questions[index].answer!.keys.toList()[i],
                    style: const TextStyle(
                      color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: isPressed ? index + 1 == questions.length
                      ? (){
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context)=> ResultScreen(score)),
                      );
                      }
                      : (){
                        _controller!.nextPage(duration: const Duration(microseconds: 750), curve: Curves.easeInExpo);
                        setState(() {
                          isPressed = false;
                        });
                      }
                      : null,
                      style: OutlinedButton.styleFrom(
                        shape: StadiumBorder(),
                        side: BorderSide(color: Colors.orange,width: 1.0),
                      ),
                      child:  Text(
                        index + 1 == questions.length
                            ? "End"
                            : "Next",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}