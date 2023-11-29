import 'package:flutter/material.dart';
import 'package:game_tomato/customs/route.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: const Text(
            'Settings',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 25),
          ),
          toolbarHeight: 80,
        ),
        body: Column(
          children: [
            _MoreOptionCard(
              title: 'About Game',
              icon: Icons.info,
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.aboutgameRoute);
              },
            ),
            _MoreOptionCard(
              title: 'Contact Us',
              icon: Icons.phone,
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.contactusRoute);
              },
            ),
          ],
        ));
  }
}

class _MoreOptionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _MoreOptionCard({
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(
                icon,
                size: 28,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
