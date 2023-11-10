import 'package:flutter/material.dart';
import 'package:game_tomato/customs/route.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: 'Aayush Thanet'.text.make(),
            accountEmail: 'Aayu.thanet@gmail.com'.text.make(),
            currentAccountPicture: CircleAvatar(),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.black, // Set the icon color to black
            ),
            title: Text('Settings'),
            onTap: () {
              // Handle Settings action
            },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.black, // Set the icon color to black
            ),
            title: Text('Log out'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.loginRoute);
            },
          ),
        ],
      ),
    );
  }
}
