import 'package:flutter/material.dart';
import 'package:game_tomato/customs/buttons.dart';
import 'package:game_tomato/customs/route.dart';
import 'package:game_tomato/customs/textfield.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  TextEditingController myController1 = TextEditingController();

  TextEditingController myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   title: Center(
        //     child: Text(
        //       'Sign up Page',
        //       style: TextStyle(color: Colors.black),
        //     ),
        //   ),
        //   automaticallyImplyLeading:
        //       false, // Set this property to false to remove the back button
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 30.heightBox,
              Image.asset('images/tomato_mind_bender_bg.png'),
              // 30.heightBox,
              Column(
                children: [
                  CustomTextField(
                    labelText: 'Enter your Full Name',
                    hintText: 'Enter your Full Name',
                    prefixIcon: Icons.person,
                    controller: myController1,
                  ),
                  CustomTextField(
                    labelText: 'Enter your Email',
                    hintText: 'Enter your Email',
                    prefixIcon: Icons.mail,
                    controller: myController1,
                  ),
                  CustomTextField(
                    labelText: 'Enter your Phone Number',
                    hintText: 'Enter your Phone Number',
                    prefixIcon: Icons.phone,
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
                text: 'Sign up',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    MyRoutes.loginRoute,
                  );
                },
              ),
              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?'),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.loginRoute);
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(color: Colors.deepPurple),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
