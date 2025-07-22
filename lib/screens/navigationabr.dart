import 'package:flutter/material.dart';
import 'package:internshipproject11/screens/Profile.dart';
import 'package:internshipproject11/screens/dashbord.dart';
import 'package:internshipproject11/screens/message.dart';
import 'package:internshipproject11/screens/question.dart';
import 'package:internshipproject11/screens/trending.dart';

class Bottomview extends StatefulWidget {
  const Bottomview({super.key});

  @override
  State<Bottomview> createState() => _BottomviewState();
}

class _BottomviewState extends State<Bottomview> {

  List<Widget> screenList = [Dashbord(image: "", title: "", subtitle: ""),QuestionPage(),trending(),message(),profile()];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: screenList.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFFFFFFFF
          ),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedIconTheme: IconThemeData(size: 24),
          unselectedIconTheme: IconThemeData(size: 24),
          onTap: (val){
            selectedIndex = val;
            setState(() {});
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(icon: Image.asset("assets/images/home.png",width: 20,height: 20.5,color: selectedIndex == 0 ? Colors.green : Colors.grey,),label: ""),
            BottomNavigationBarItem(icon: Image.asset("assets/images/question.png",width: 24,height: 24,color: selectedIndex == 1 ? Colors.green : Colors.grey,),label: ""),
            BottomNavigationBarItem(icon: Image.asset("assets/images/utube.png",width: 24,height: 24,color: selectedIndex == 2 ? Colors.green : Colors.grey,),label: ""),
            BottomNavigationBarItem(icon: Image.asset("assets/images/messages.png",width: 24,height: 24,color: selectedIndex == 3 ? Colors.green : Colors.grey,),label: ""),
            BottomNavigationBarItem(icon: Image.asset("assets/images/profile.png",width: 24,height: 24,color: selectedIndex == 4 ? Colors.green : Colors.grey,),label: ""),
          ]),
    );
  }
}