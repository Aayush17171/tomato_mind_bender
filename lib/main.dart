import 'package:flutter/material.dart';
import 'package:game_tomato/customs/route.dart';
import 'package:game_tomato/screens/home.dart';
import 'package:game_tomato/screens/login.dart';
import 'package:game_tomato/screens/settings.dart';
import 'package:game_tomato/screens/signup.dart';
import 'package:game_tomato/screens/sub_screens/about_game.dart';
import 'package:game_tomato/screens/sub_screens/contact_us.dart';
import 'package:game_tomato/screens/sub_screens/how_to_play.dart';

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
        MyRoutes.settingsRoute: (context) => SettingsPage(),
        MyRoutes.aboutgameRoute: (context) => AboutGamePage(),
        MyRoutes.contactusRoute: (context) => ContactUsPage(),
        MyRoutes.rulesRoute: (context) => RulesPage(),
      },
    );
  }
}
