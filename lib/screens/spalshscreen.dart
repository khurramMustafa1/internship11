import 'dart:async';

import 'package:flutter/material.dart';

import 'onbordingscreen.dart';

class splash extends StatefulWidget {
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>onboarding_screen()),);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 290,
          ),
          Image.asset("assets/images/splash.jpg",height: 118, width: 119,),
          Text("AgriExpert",style: TextStyle(fontFamily: "Raleway",
              fontWeight: FontWeight.w500,fontSize: 23),),
       SizedBox(height:300,),
          Text("Powered by",style: TextStyle(fontFamily: "Raleway",
              fontWeight: FontWeight.w400,fontSize: 16,color: Color(0xffB7B9C6)
              ),),
          SizedBox(height: 10,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/farm1.jpg',height: 22.4,width: 23.69,),
                SizedBox(width: 5,),
                Text("FARM TECH",style: TextStyle(
                  fontSize: 18.74,fontWeight: FontWeight.w300,fontFamily: "Raleway",color: Color(0xff292929)
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
