import 'package:flutter/material.dart';
import 'package:zoom_clone/features/auth/services/auth_services.dart';

class AppMainScreen extends StatelessWidget {
  const AppMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Main Screen"),

            IconButton(
              onPressed: () {
                AuthServices.signOut();
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
