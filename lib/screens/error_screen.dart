
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  static const String routeName = '/error_page';

  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          primary: true,
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          children: const [
            Column(
              children: [
                Text(
                  '404',
                  style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text('Error Page'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}