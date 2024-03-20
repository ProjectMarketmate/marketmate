import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: Color(0xff53B175),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('Contact Us'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Privacy Policy'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Terms & Conditions'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
