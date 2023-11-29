import 'package:flutter/material.dart';

class AboutGamePage extends StatelessWidget {
  const AboutGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'About Tomato Mind Bender',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tomato Mind Bender is an engaging puzzle game designed to challenge your mind and improve cognitive skills. The game offers a series of intriguing visual and numerical puzzles where players need to solve tasks related to tomatoes, using their logic and arithmetic abilities.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'How to Play',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'In Tomato Mind Bender, players are presented with a variety of tomato-themed puzzles. Users need to carefully analyze the visual or numerical clues provided and input the correct solution within the game interface. The game\'s difficulty progresses as players advance through levels, offering increasingly challenging puzzles.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Our Mission',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Our mission is to provide an entertaining and educational gaming experience. Tomato Mind Bender aims to enhance problem-solving skills, critical thinking, and mental agility while offering an enjoyable gameplay experience for users of all ages.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 32),
              Center(
                child: Text(
                  'Thank you for playing Tomato Mind Bender!',
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
