import 'package:flutter/material.dart';
import 'package:internshipproject11/models/UserModel.dart';
import 'package:internshipproject11/screens/login.dart';
import 'package:internshipproject11/screens/registration2.dart';
import 'package:internshipproject11/services/auth.dart';
import 'package:string_validator/string_validator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register1 extends StatefulWidget {
  const Register1({super.key});

  @override
  State<Register1> createState() => _Register1State();
}

class _Register1State extends State<Register1> {
  bool isLoading = false;

  // Controllers
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

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    confirmpassword.dispose();
    nameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Container(color: Colors.white),
            Image.asset(
              "assets/images/loginback.jpg",
              width: double.infinity,
              height: screenHeight * 0.45,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: screenHeight * 0.2,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Create Account",
                                style: TextStyle(
                                    fontSize: 23.04,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Raleway',
                                    color: Color(0xFF292929))),
                            SizedBox(height: 5),
                            Text("Login to Access Your Account",
                                style: TextStyle(
                                    fontSize: 13.33,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Raleway',
                                    color: Color(0xFFB4B4B4))),
                            SizedBox(height: 15),

                            // Name Field
                            buildTextField("Name", name, nameFocus, isNameFocused),
                            SizedBox(height: 15),

                            // Email Field
                            buildTextField("Email", email, emailFocus, isEmailFocused,
                                keyboardType: TextInputType.emailAddress),
                            SizedBox(height: 15),

                            // Password Field
                            buildTextField("Password", password, passwordFocus, isPasswordFocused,
                                isPassword: true),
                            SizedBox(height: 15),

                            // Confirm Password Field
                            buildTextField("Confirm Password", confirmpassword,
                                confirmPasswordFocus, isConfirmPasswordFocused,
                                isPassword: true),

                            SizedBox(height: 58),

                            isLoading
                                ? Center(child: CircularProgressIndicator())
                                : Center(
                              child: SizedBox(
                                height: 60,
                                width: 315,
                                child: ElevatedButton(
                                  onPressed: handleRegistration,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF339D44),
                                    foregroundColor: Color(0xFFF4F4F4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Raleway',
                                    ),
                                  ),
                                  child: Text("Next"),
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            Text("Already have an account?",
                                style: TextStyle(
                                    fontSize: 13.33,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Raleway',
                                    color: Color(0xFF292929))),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => login()));
                            },
                            child: Text("Login",
                                style: TextStyle(
                                    fontSize: 27.65,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Raleway',
                                    color: Color(0xFF339D44))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, TextEditingController controller,
      FocusNode focusNode, bool isFocused,
      {TextInputType keyboardType = TextInputType.text, bool isPassword = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: isFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: TextStyle(
            fontSize: 13.33,
            fontWeight: FontWeight.w400,
            fontFamily: 'Raleway',
            color: isFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
          ),
        ),
      ),
    );
  }

  Future<void> handleRegistration() async {
    if (name.text.isEmpty ||
        email.text.isEmpty ||
        password.text.isEmpty ||
        confirmpassword.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("All fields must be filled")));
      return;
    }

    if (!email.text.isEmail) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Enter a valid email")));
      return;
    }

    if (password.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password must be at least 6 characters")));
      return;
    }

    if (password.text != confirmpassword.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Passwords do not match")));
      return;
    }

    try {
      setState(() {
        isLoading = true;
      });

      await AuthServies().signupUser(
          email: email.text, password: password.text);

      UserModel user = UserModel(
        name: name.text,
        email: email.text,
        createdat: DateTime.now().toString(),
        profileimage: ' ',
        expertise: ' ',
        qualifications: ' ',
        degreeimage: ' ',
        adress: ' ',
        contact: ' ',
        docid: " "
      );
      await FirebaseFirestore.instance
          .collection('users')
          .add(user.toJson());

      setState(() {
        isLoading = false;
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => registration2()));
    } catch (e) {
      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }
}
