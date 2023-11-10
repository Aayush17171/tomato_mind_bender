import 'package:flutter/material.dart';
import 'package:game_tomato/customs/buttons.dart';
import 'package:game_tomato/customs/route.dart';
import 'package:game_tomato/customs/textfield.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController myController1 = TextEditingController();

  TextEditingController myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
            child: Text(
              'Log in Page',
              style: TextStyle(color: Colors.black),
            ),
          ),
          automaticallyImplyLeading:
              false, // Set this property to false to remove the back button
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              50.heightBox,
              Image.asset('images/login.png'),
              30.heightBox,
              Column(
                children: [
                  CustomTextField(
                    labelText: 'Enter your Email',
                    hintText: 'Enter your Email',
                    prefixIcon: Icons.mail,
                    controller: myController1,
                  ),
                  CustomTextField(
                    labelText: 'Enter your Password',
                    hintText: 'Enter your Password',
                    prefixIcon: Icons.lock,
                    controller: myController2,
                    isPassword: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      } else if (value.length < 6) {
                        return "Password length should be at least 6";
                      }
                      return null;
                    },
                  ),
                ],
              ),
              30.heightBox,
              CustomButton(
                text: 'Log in',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    MyRoutes.homeRoute,
                  );
                },
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Didn\'t have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.signupRoute);
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: Colors.deepPurple),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
