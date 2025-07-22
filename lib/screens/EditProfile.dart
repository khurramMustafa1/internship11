import 'package:flutter/material.dart';

class edit_profile extends StatefulWidget {
  const edit_profile({super.key});

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

// FocusNodes
  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();

// Focus state variables
  bool isnameFocused = false;
  bool isemailFocused = false;

  @override
  void initState() {
    super.initState();
    emailFocus.addListener(() {
      setState(() {
        isnameFocused = nameFocus.hasFocus;
      });
    });

    emailFocus.addListener(() {
      setState(() {
        isemailFocused = emailFocus.hasFocus;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.green,),),
        title: Text("Profile", style: TextStyle(fontSize: 23.04,fontWeight:
        FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  ClipOval(
                    child: Image.asset('assets/images/pro1.jpg', width: 82, height: 82, fit: BoxFit.cover,),
                  ),
                  Positioned( // this set position of wigdet
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: GestureDetector(
                        child: Center(    // this is use to overlay each other
                          child: Image.asset("assets/images/edit.png", width: 32, height: 32,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ),

            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(right:26 ,left:34 ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: isnameFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: name,
                  focusNode: nameFocus,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "name",
                    labelStyle: TextStyle(fontSize: 13.33, fontWeight: FontWeight.w400,
                      fontFamily: 'Raleway', color: isnameFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(right:26 ,left:34 ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: isemailFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: email,
                  focusNode: emailFocus,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "email",
                    labelStyle: TextStyle(fontSize: 13.33, fontWeight: FontWeight.w400,
                      fontFamily: 'Raleway', color: isemailFocused? Color(0xFF339D44) : Color(0xFFB4B4B4),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 370,),

            Center(
              child: SizedBox(
                height: 60,
                width: 315,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF339D44), // Button color
                    foregroundColor: Color(0xFFF4F4F4), // Text/icon color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Raleway',
                    ),
                  ),
                  child: Text("Save Changes"),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}