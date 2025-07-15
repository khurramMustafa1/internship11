import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:internshipproject11/screens/trending.dart';

class add_video extends StatefulWidget {
  const add_video({super.key});

  @override
  State<add_video> createState() => _add_videoState();
}

class _add_videoState extends State<add_video> {
  @override
  TextEditingController title=TextEditingController();
  TextEditingController description=TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: ()
            {
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back, color: Colors.green,)),
        title: Text("Add Video", style: TextStyle(fontSize: 23.04,fontWeight:
        FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 5,),
            Container(
              height: 179,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Image.asset(
                  'assets/images/addvideo1.jpg', width: 48, height: 48,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  DottedBorder(
                      borderType: BorderType.RRect,
                      radius: Radius.circular(7),
                      color: Color(0xFF339D44), // border color
                      strokeWidth: 1,
                      dashPattern: [9, 9],

                      child: Container(
                        width: 315,
                        height: 50,
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Upload Video", style: TextStyle(fontSize: 13.33,fontWeight:
                              FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),

                              GestureDetector(onTap: (){
                              },
                                  child: Image.asset("assets/images/upload.jpg", width: 18, height: 20,)),
                            ],

                          ),
                        ),

                      )),
                  SizedBox(height: 20,),

                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(7),
                    color: Color(0xFF339D44), // border color
                    strokeWidth: 1,
                    dashPattern: [9, 9],

                      child: Container(
                        width: 315,
                        height: 50,
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Upload Thumbnail", style: TextStyle(fontSize: 13.33,fontWeight:
                              FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),

                              GestureDetector(onTap: (){
                              },
                                  child: Image.asset("assets/images/upload.jpg", width: 18, height: 20,)),
                            ],

                          ),
                        ),

                      )),

                  SizedBox(height: 20,),

                  SizedBox(
                    height: 60,
                    width: 320,
                    child: TextField(
                      controller: title,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        label: Text("Title", style: TextStyle(fontSize: 13.33,fontWeight:
                        FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD4D4D4)), // inactive border
                          borderRadius: BorderRadius.circular(8),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF339D44), width: 2), // active border
                          borderRadius: BorderRadius.circular(8),
                        ),

                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  SizedBox(
                    height: 115,
                    width: 320,
                    child: TextFormField(
                      controller: description,
                      keyboardType: TextInputType.multiline,
                      maxLines: null, // Allows infinite lines
                      minLines: 5,
                      decoration: InputDecoration(
                        label: Text("Description", style: TextStyle(fontSize: 13.33,fontWeight:
                        FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFD4D4D4)), // inactive border
                          borderRadius: BorderRadius.circular(8),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF339D44), width: 2), // active border
                          borderRadius: BorderRadius.circular(8),
                        ),

                      ),
                    ),
                  ),

                  SizedBox(height: 59,),

                  Center(
                    child: SizedBox(
                      height: 60,
                      width: 315,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(context: context,
                              barrierDismissible: false,
                              builder: (context){
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset("Assets/images/tick.jpg", width: 48, height: 48,),
                                      Text("Uploaded", style: TextStyle(fontSize: 23.03 ,fontWeight:
                                      FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                                    ],
                                  ),
                                  content: Padding(
                                    padding: const EdgeInsets.only(left: 23.5, right: 23.5),
                                    child: Text("Video Uploaded", textAlign: TextAlign.center,style: TextStyle(fontSize: 13.33 ,fontWeight:
                                    FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFFB4B4B4),),),
                                  ),

                                  actions: [
                                    Center(
                                      child: SizedBox(
                                        height: 60,
                                        width: 255,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => trending()),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFF339D44), // Button color
                                            foregroundColor: Color(0xFFF4F4F4), // Text color
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Raleway',
                                            ),
                                          ),
                                          child: Text("View Videos"),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF339D44), // Button color
                          foregroundColor: Color(0xFFF4F4F4), // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Raleway',
                          ),
                        ),
                        child: Text("Post"),
                      ),
                    ),
                  ),

                ],
              ),
            )

          ],
        ),
      ),

    );
  }
}