import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Contact Us',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 16),
              const Text(
                'We value your feedback and suggestions. Please feel free to contact us for any inquiries or assistance.',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Email'),
                subtitle: const Text('ayush.thanet@patancollege.edu.np'),
                onTap: () {
                  // Implement email functionality
                },
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Phone'),
                subtitle: const Text('+977 9800761590'),
                onTap: () {
                  // Implement phone functionality
                },
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: const Text('Address'),
                subtitle: const Text('Kawasoti-17, Nawalpur, Nepal'),
                onTap: () {
                  // Implement location functionality
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: const Text('Website'),
                subtitle: const Text('https://aayushthanet.com.np/'),
                onTap: () {
                  // Implement location functionality
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
