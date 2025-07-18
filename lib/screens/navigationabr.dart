import 'package:flutter/material.dart';
import 'dashbord.dart';
import 'message.dart';
import 'Profile.dart';
import 'question.dart';
import 'trending.dart';

class bottomnavbar extends StatefulWidget {
  const bottomnavbar({super.key});

  @override
  State<bottomnavbar> createState() => _bottomnavbarState();
}

class _bottomnavbarState extends State<bottomnavbar> {
  int selectedIndex = 1;

  List<Widget> screenList = [
    Dashbord(image: '', title: '', subtitle: ''),
    const QuestionPage(),
    const trending(),
    const message(),
    const profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark, size: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library, size: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment, size: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 24),
            label: '',
          ),
        ],
      ),
    );
  }
}
