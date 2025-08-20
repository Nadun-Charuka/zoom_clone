import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              meetFeatures(
                color: Colors.orange,
                icon: FontAwesomeIcons.video,
                onTap: () {},
                name: 'meet',
              ),
              meetFeatures(
                color: Colors.blue,
                icon: FontAwesomeIcons.solidSquarePlus,
                onTap: () {},
                name: 'join',
              ),
              meetFeatures(
                color: Colors.blue,
                icon: FontAwesomeIcons.calendarDay,
                onTap: () {},
                name: 'schedule',
              ),
              meetFeatures(
                color: Colors.blue,
                icon: FontAwesomeIcons.share,
                onTap: () {},
                name: 'share',
              ),
            ],
          ),
        ],
      ),
    );
  }

  InkWell meetFeatures({
    required Color color,
    required IconData icon,
    required Function onTap,
    required String name,
  }) {
    return InkWell(
      onTap: () {
        onTap;
      },
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(name),
        ],
      ),
    );
  }
}
