import 'package:flutter/material.dart';
import 'package:zoom_clone/features/auth/services/auth_services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Profile Screen"),

          IconButton(
            onPressed: () {
              AuthServices.signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
