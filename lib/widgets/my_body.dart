// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:game_tomato/customs/buttons.dart';
import 'package:game_tomato/customs/route.dart';
import 'package:game_tomato/customs/textfield.dart';
import 'package:game_tomato/screens/home.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class myBody extends StatefulWidget {
  myBody({
    super.key,
  });

  @override
  State<myBody> createState() => _myBodyState();
}

class _myBodyState extends State<myBody> {
  TextEditingController myController1 = TextEditingController();

  int score = 1;
  // Initialize the score
  GameState gameState = GameState.Playing;

  Future<void> getNextQuestion() async {
    final apiUrl =
        Uri.parse('http://marcconrad.com/uob/tomato/api.php?out=json');
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final apiSolution =
          data['solution']; // Assuming the API response has a 'solution' field

      if (apiSolution is int && apiSolution >= 0 && apiSolution <= 99) {
        // Update your score calculation
        score = max(1, score);
      } else {
        // Handle an invalid or out-of-range solution from the API
      }
    } else {
      // Handle an error response from the API
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Map<String, dynamic>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final data = snapshot.data!;
                  final question = data['question'];
                  final solution = data['solution'];

                  return Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomButton(
                            text: 'Rules',
                            onPressed: () {
                              Navigator.pushNamed(context, MyRoutes.rulesRoute);
                            },
                          ),
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
                      25.heightBox,
                      Image.network(question),
                      Text(
                          'Solution: $solution'), // It shows the correct answer
                      50.heightBox,
                      CustomTextField(
                        labelText: 'Enter your Answer',
                        hintText: 'Enter your Answer',
                        prefixIcon: Icons.numbers,
                        controller: myController1,
                      ),
                      15.heightBox,
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
                                  content:
                                      Text('✅ Correct! Your Score: $score'),
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
                      ),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> fetchData() async {
  final response = await http.get(
    Uri.parse("http://marcconrad.com/uob/tomato/api.php?out=json&base64=no"),
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}
