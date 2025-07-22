import 'package:flutter/material.dart';
import 'package:internshipproject11/screens/Exit.dart';
import 'package:internshipproject11/screens/Nointernet.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.green,),),
        title: Text("Profile", style: TextStyle(fontSize: 23.04,fontWeight:
        FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 30, left: 30, top: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Account", style: TextStyle(fontSize: 13.13,fontWeight:
                FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>No_internet()));
                }, icon: Icon(Icons.arrow_forward_ios,color: Color(0xFFD4D4D4),))

              ],
            ),
            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rate our app", style: TextStyle(fontSize: 13.13,fontWeight:
                FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                Icon(Icons.arrow_forward_ios,color: Color(0xFFD4D4D4),)

              ],
            ),
            SizedBox(height: 15,),

            Row(
              children: [
                Image.asset("assets/images/logout.jpg", width: 24, height: 24,),
                SizedBox(width: 8,),
                TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ExitAppScreen()));}, child: Text( "Logout", style: TextStyle(fontSize: 13.13,fontWeight:
                FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFFF24E1E),),),)

              ],
            ),
          ],
        ),
      ),

    );
  }
}