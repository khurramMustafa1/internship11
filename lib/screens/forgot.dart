import 'package:flutter/material.dart';
import 'registration2.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  TextEditingController emailcontroller = TextEditingController();

  // FocusNodes
  FocusNode emailFocus = FocusNode();

  // Focus state variables
  bool isEmailFocused = false;

  @override
  void initState() {
    super.initState();
    emailFocus.addListener(() {
      setState(() {
        isEmailFocused = emailFocus.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
          ),
          Image.asset(
            'assets/images/loginback.jpg',
            fit: BoxFit.cover,
            width: screenHeight,
          ),
          Positioned(
            top: screenHeight * 0.35,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: screenHeight * 0.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      const Text(
                        "Forgot Password",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        "Enter your registered email below \n we'll send you a reset link",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: isEmailFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          controller: emailcontroller,
                          focusNode: emailFocus,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontSize: 13.33,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Raleway',
                              color: isEmailFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 222),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => registration2()),
                            );
                          },
                          child: const Text("Get Link", style: TextStyle(color: Colors.white)),
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

  @override
  void dispose() {
    emailFocus.dispose();
    emailcontroller.dispose();
    super.dispose();
  }
}
