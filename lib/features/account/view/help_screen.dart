import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

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
              onTap: () {
                showSupportMessage(context);
              },
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

void showSupportMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 18),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const Text('Contact Support'),
            SizedBox(
              width: 30,
            )
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Whatsapp Number: +91 1234567890',
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                launchWhatsapp('https://wa.me/1234567890');
              },
              child: const Text('Whatsapp'),
            ),
            SizedBox(height: 10),
            Text(
              'Support Email: support@example.com',
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                launchEmail('mailto:support@example.com');
              },
              child: const Text('Email'),
            ),
          ],
        ),
      );
    },
  );
}

void launchWhatsapp(String url) {
  launchUrl(url);
}

void launchEmail(String url) {
  launchUrl(url);
}

Future<void> launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
