

import 'package:flutter/material.dart';
import 'package:game_tomato/widgets/my_body.dart';
import 'package:game_tomato/widgets/my_drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class myHomePage extends StatefulWidget {
  myHomePage({super.key});

  @override
  _myHomePageState createState() => _myHomePageState();
}

enum GameState { Playing, GameOver }

class _myHomePageState extends State<myHomePage> {

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
            myBody(),
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
