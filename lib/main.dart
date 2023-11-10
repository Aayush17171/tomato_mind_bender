import 'package:flutter/material.dart';
import 'package:game_tomato/customs/route.dart';
import 'package:game_tomato/screens/home.dart';
import 'package:game_tomato/screens/login.dart';
import 'package:game_tomato/screens/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: myHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        '/': (context) => LoginPage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => myHomePage(),
        MyRoutes.signupRoute: (context) => SignupPage(),
      },
    );
  }
}
