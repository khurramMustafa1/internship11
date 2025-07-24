import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'registration.dart';

class registration2 extends StatefulWidget {
  const registration2({super.key});

  @override
  State<registration2> createState() => _registration2State();
}

String? selectedExpertise;

class _registration2State extends State<registration2> {
  @override
  TextEditingController adresscontroller = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController contact = TextEditingController();

// FocusNodes
  FocusNode qualificationFocus = FocusNode();
  FocusNode contactFocus = FocusNode();
  FocusNode adressFocus = FocusNode();
// Focus state variables
  bool isqualificationFocused = false;
  bool iscontactFocused = false;
  bool isadressFocused = false;
  @override
  void initState() {
    super.initState();
    qualificationFocus.addListener(() {
      setState(() {
        isqualificationFocused = qualificationFocus.hasFocus;
      });
    });

    contactFocus.addListener(() {
      setState(() {
        iscontactFocused = contactFocus.hasFocus;
      });
    });
    adressFocus.addListener(() {
      setState(() {
        isadressFocused = adressFocus.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    qualification.dispose();
    contact.dispose();
    adresscontroller.dispose();

    qualificationFocus.dispose();
    contactFocus.dispose();
    adressFocus.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 30, right: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Personal Details",
                  style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Raleway")),
              SizedBox(height: 5),
              Text("Enter your personal details",
                  style: TextStyle(
                      fontSize: 13.33,
                      fontFamily: "Raleway",
                      color: Colors.grey)),
              SizedBox(height: 30),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(7),
                color: Color(0xff339D44),
                strokeWidth: 1,
                dashPattern: [9, 9],
                child: Container(
                  width: 315,
                  height: 50,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Upload Profile image",
                          style: TextStyle(
                              fontSize: 13.33,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff292929)),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.upload, color: Colors.green))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 320,
                child: DropdownButtonFormField<String>(
                  value: selectedExpertise,
                  hint: Text(
                    "Choose Expertise",
                    style: TextStyle(
                      fontSize: 13.33,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Raleway',
                      color: Color(0xFFD4D4D4),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 13.33,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Raleway',
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFD4D4D4)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFD4D4D4)),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  items: ['python', 'Science', 'Programming']
                      .map((e) => DropdownMenuItem(child: Text(e), value: e))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedExpertise = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: isqualificationFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: qualification,
                  focusNode: qualificationFocus,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Qualification",
                    labelStyle: TextStyle(fontSize: 13.33, fontWeight: FontWeight.w400,
                      fontFamily: 'Raleway', color: isqualificationFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(7),
                color: Color(0xff339D44),
                strokeWidth: 1,
                dashPattern: [9, 9],
                child: Container(
                  width: 315,
                  height: 50,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Upload Latest Degree Image ",
                          style: TextStyle(
                              fontSize: 13.33,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff292929)),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.upload, color: Colors.green))
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: isadressFocused ? Color(0xFF339D44) : Color(0xFFD4D4D4),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextFormField(
                    controller: adresscontroller,
                    focusNode: adressFocus,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    minLines: 3,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "adress",
                      labelStyle: TextStyle(fontSize: 13.33, fontWeight: FontWeight.w400,
                        fontFamily: 'Raleway', color: isadressFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                      ),
                    ),
                  ),
                ),),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: iscontactFocused? Color(0xFF339D44) : Color(0xFFD4D4D4),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: contact,
                  focusNode: contactFocus,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "contact",
                    labelStyle: TextStyle(fontSize: 13.33, fontWeight: FontWeight.w400,
                      fontFamily: 'Raleway', color: iscontactFocused ? Color(0xFF339D44) : Color(0xFFB4B4B4),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 47),
              SizedBox(
                width: 325,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              title: Padding(
                                padding:
                                const EdgeInsets.only(left: 23.5, right: 23.5),
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/done.jpg",
                                        width: 48, height: 48),
                                    Text(
                                      "Account Created",
                                      style: TextStyle(
                                        fontSize: 23.03,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Raleway',
                                        color: Color(0xFF292929),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              content: Text(
                                " You can now access your account",
                                style: TextStyle(
                                  fontSize: 12.33,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Raleway',
                                  color: Color(0xFFB4B4B4),
                                ),
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
                                          MaterialPageRoute(
                                              builder: (context) => login()),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Color(0xFF339D44),
                                        foregroundColor: Color(0xFFF4F4F4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                        textStyle: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Raleway',
                                        ),
                                      ),
                                      child: Text("Login"),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(height: 19),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Register1()),
                      );
                    },
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 13.33,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
