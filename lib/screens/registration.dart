import 'package:flutter/material.dart';
import 'package:internshipproject11/screens/login.dart';

import 'registration2.dart';


class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

// FocusNodes
  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

// Focus state variables
  bool isNameFocused = false;
  bool isEmailFocused = false;
  bool isPasswordFocused = false;
  bool isConfirmPasswordFocused = false;

  @override
  void initState() {
    super.initState();

    nameFocus.addListener(() {
      setState(() {
        isNameFocused = nameFocus.hasFocus;
      });
    });

    emailFocus.addListener(() {
      setState(() {
        isEmailFocused = emailFocus.hasFocus;
      });
    });

    passwordFocus.addListener(() {
      setState(() {
        isPasswordFocused = passwordFocus.hasFocus;
      });
    });

    confirmPasswordFocus.addListener(() {
      setState(() {
        isConfirmPasswordFocused = confirmPasswordFocus.hasFocus;
      });
    });
  }
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white
            ),
          ),
          // 🔹 Background Image
          Image.asset(
            'assets/images/regback.jpg', // Make sure this image exists in assets
            fit: BoxFit.cover,
          ),

          // 🔹 Overlapping White Container (Starting inside image)
          Positioned(
            top: 180,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: screenHeight*0.55,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30,right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Create Account",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        "Login to Access Your Account.",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: isNameFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
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
                              fontFamily: 'Raleway', color: isNameFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: isEmailFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
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
                            labelText: "Email",
                            labelStyle: TextStyle(fontSize: 13.33, fontWeight: FontWeight.w400,
                              fontFamily: 'Raleway', color: isEmailFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: isPasswordFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: password,
                          focusNode: passwordFocus,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Password",
                            labelStyle: TextStyle(fontSize: 13.33, fontWeight: FontWeight.w400,
                              fontFamily: 'Raleway', color: isPasswordFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: isConfirmPasswordFocused? Color(0xFF339D44) : Color(0xFFD4D4D4),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: confirmpassword,
                          focusNode: confirmPasswordFocus,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "confirm pasword",
                            labelStyle: TextStyle(fontSize: 13.33, fontWeight: FontWeight.w400,
                              fontFamily: 'Raleway', color: isConfirmPasswordFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 58),
                      // Next button
                      SizedBox(
                        width: 315,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>registration2()));
                            // Handle next
                          },
                          child: const Text("Next",style: TextStyle(color:Colors.white),),
                        ),
                      ),

                      const SizedBox(height: 23),

                      const Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),

                      Align(
                        alignment: Alignment.centerLeft, // This is the key
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero, // Remove extra default padding
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Optional
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 27.65,
                              fontFamily: "Raleway",
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
