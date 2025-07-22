import 'package:flutter/material.dart';

import 'forgot.dart';
import 'navigationabr.dart';
import 'registration.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

// FocusNodes
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

// Focus state variables
  bool isEmailFocused = false;
  bool isPasswordFocused = false;

  @override
  void initState() {
    super.initState();
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
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    emailFocus.dispose();
    passwordFocus.dispose();

    super.dispose();
  }
  @override
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
            'assets/images/loginback.jpg', // Make sure this image exists in assets
            fit: BoxFit.cover,
            width: screenHeight,
          ),

          // 🔹 Overlapping White Container (Starting inside image)
          Positioned(
            top: screenHeight*0.35,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: screenHeight*0.5,
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
                        "Welcome Again",
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
                              fontFamily: 'Raleway', color: isPasswordFocused? Color(0xFF339D44) : Color(0xFFB4B4B4),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Forgot()));
                        },
                            child: Text("Forgot Password",style:
                            TextStyle(color: Colors.green,fontSize: 13.33,fontWeight: FontWeight.w500,fontFamily: "raleway"),)),
                      ),
                      const SizedBox(height: 24),
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
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottomview()));
                            // Handle next
                          },
                          child: const Text("Login",style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      const SizedBox(height: 23),
                      const Text(
                        "Don't have an account?",
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
                              MaterialPageRoute(builder: (context) => Registration()),
                            );
                          },
                          child: const Text(
                            "Signup",
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
