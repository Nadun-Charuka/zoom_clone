import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zoom_clone/core/utils/colors.dart';
import 'package:zoom_clone/features/auth/services/auth_services.dart';
import 'package:zoom_clone/features/home/chat_screen.dart';
import 'package:zoom_clone/features/home/home_screen.dart';
import 'package:zoom_clone/features/home/profile_screen.dart';
import 'package:zoom_clone/features/home/setting_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    ChatScreen(),
    SettingScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Zoom Clone"),
        actions: [
          ClipOval(
            child: Image.network(
              "${AuthServices.currentUser?.photoURL}",
              width: 40,
              height: 40,
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      backgroundColor: bodyColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidMessage),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.gear),
            label: "Setting",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.userLarge),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

// class VideoConferencePage extends StatelessWidget {
//   final String conferenceID;

//   const VideoConferencePage({
//     super.key,
//     required this.conferenceID,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       // !mark(1:8)
//       child: ZegoUIKitPrebuiltVideoConference(
//         appID: int.parse(
//           zegoAppID,
//         ),
//         appSign: zegoAppSign,
//         userID: 'user_id',
//         userName: 'user_name',
//         conferenceID: conferenceID,
//         config: ZegoUIKitPrebuiltVideoConferenceConfig(),
//       ),
//     );
//   }
// }
