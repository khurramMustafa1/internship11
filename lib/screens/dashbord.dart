import 'package:flutter/material.dart';
import 'package:internshipproject11/models/DashboardItem.dart';
import '../models/DashboardItem.dart';
class Dashbord extends StatefulWidget {
  const Dashbord({super.key, required String image, required String title, required String subtitle});

  @override
  State<Dashbord> createState() => _Dashbord();
}

class _Dashbord extends State<Dashbord> {
  @override
  List<homemodel> model=[
    homemodel(
      image: 'assets/images/question.jpg',
      title: '224',
      subtitle: 'Total Questions',
    ),
    homemodel(
      image: 'assets/images/tick.jpg',
      title: '154',
      subtitle: 'Answered \n Questions',
    ),
    homemodel(
      image: 'assets/images/f3.jpg',
      title: '1.5k',
      subtitle: 'Total Views',
    ),
    homemodel(
      image: 'assets/images/f4.jpg',
      title: '12',
      subtitle: 'total videos',
    ),


  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Dashboard!", style: TextStyle(fontSize: 23.04,fontWeight:
            FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
            Row(
              children: [
                Text("Welcome to dashboard,", style: TextStyle(fontSize: 11.11,fontWeight:
                FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),
                Text("Ali", style: TextStyle(fontSize: 11.11,fontWeight:
                FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),
              ],
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: model.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.6
                  ), itemBuilder:(context,i)
              {
                return Container(
                  height: 105,
                  width: 153,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05), // Shadow color
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 2), // Shadow position
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Image.asset(
                        model[i].image,
                        width: 58,
                        height: 58,
                      ),
                      SizedBox(width: 3,),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(model[i].title,style: TextStyle(fontSize: 23.04,fontWeight:
                              FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),)),

                              Text(model[i].subtitle,style: TextStyle(fontSize: 9.26,fontWeight:
                              FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),)),
                            ]

                        ),
                      )

                    ],
                  ),
                );

              }),
            ),
          ],
        ),
      ),
    );
  }
}