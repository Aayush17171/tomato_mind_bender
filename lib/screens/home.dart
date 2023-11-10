import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_tomato/customs/buttons.dart';
import 'package:game_tomato/customs/textfield.dart';
import 'package:game_tomato/widgets/my_body.dart';
import 'package:game_tomato/widgets/my_drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class myHomePage extends StatefulWidget {
  myHomePage({super.key});

  @override
  _myHomePageState createState() => _myHomePageState();
}

enum GameState { Playing, GameOver }

class _myHomePageState extends State<myHomePage> {
  TextEditingController myController1 = TextEditingController();
  int solution = 0; // Initialize the solution
  int score = 1; // Initialize the score
  GameState gameState = GameState.Playing;

  Future<void> getNextQuestion() async {
    final apiUrl =
        Uri.parse('http://marcconrad.com/uob/tomato/api.php?out=json');
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // final question = data['question'];
      final apiSolution =
          data['solution']; // Assuming the API response has a 'solution' field

      if (apiSolution is int && apiSolution >= 0 && apiSolution <= 99) {
        solution = apiSolution;
        // Update your score calculation
        score = max(1, score - 1);
      } else {
        // Handle an invalid or out-of-range solution from the API
      }
    } else {
      // Handle an error response from the API
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            'Tomato Mind Bender',
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            50.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(text: 'Highest Level', onPressed: () {}),
                CustomButton(
                  text: 'Restart',
                  onPressed: () {
                    setState(() {
                      score = 1; // Reset the score when restarting
                      getNextQuestion(); // Get the next question
                      gameState = GameState.Playing;
                    });
                  },
                ),
              ],
            ),
            50.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  gameState == GameState.GameOver
                      ? 'Game Over at Level $score'
                      : 'Your Current Level: $score',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            50.heightBox,
            myBody(),
            50.heightBox,
            Column(
              children: [
                CustomTextField(
                  labelText: 'Enter your Answer',
                  hintText: 'Enter your Answer',
                  prefixIcon: Icons.numbers,
                  controller: myController1,
                ),
                20.heightBox,
                CustomButton(
                  text: "Submit",
                  onPressed: () {
                    if (gameState == GameState.GameOver) {
                      return; // Don't allow submitting in Game Over state
                    }

                    String userAnswer = myController1.text;
                    if (RegExp(r'^[0-9]$').hasMatch(userAnswer)) {
                      int userAnswerInt = int.parse(userAnswer);
                      if (userAnswerInt == solution) {
                        // User's answer is correct
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('✅ Correct! Your Score: $score'),
                          ),
                        );
                        // Clear the text field
                        myController1.clear();
                        // Increment the score and get the next question
                        setState(() {
                          score++;
                          getNextQuestion();
                        });
                      } else {
                        // User's answer is incorrect, show Game Over message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Game Over at Level $score'),
                          ),
                        );
                        // Change the game state to Game Over
                        setState(() {
                          gameState = GameState.GameOver;
                        });
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Answers must be a single digit between 0 and 9.'),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}


