import 'dart:io';
import 'package:flutter/material.dart';
import 'package:internshipproject11/Provider/provider1.dart';
import 'package:internshipproject11/Services/Review.dart' show RatingReviewService;
import 'package:internshipproject11/models/review.dart';
import 'package:internshipproject11/screen/Bottombar.dart' show bottomnavbar;
import 'package:internshipproject11/screen/EditProfile.dart';
import 'package:internshipproject11/screen/Reviews.dart';
import 'package:internshipproject11/screen/Setting.dart' show setting;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';
import '../Services/User.dart';
import '../Services/comments.dart';
import '../models/UserModel.dart';
class profile extends StatefulWidget {
  final String userId;
  const profile({super.key,required this.userId});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  final RatingReviewService _service = RatingReviewService();

  List<RatingReviewModels> reviews = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchReviews();
  }

  Future<void> fetchReviews() async {
    final fetchedReviews = await _service.getReviews();
    setState(() {
      reviews = fetchedReviews.cast<RatingReviewModels>();
      isLoading = false;
    });
  }
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Profile", style: TextStyle(fontSize: 23.04,fontWeight:
          FontWeight.bold,fontFamily: 'Raleway',color: Color(0xFF292929),),),
          actions: [
            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => setting()),
                  );
                },
                child: Image.asset("Assets/images/setting.jpg", width: 24, height: 24,)),
            SizedBox(width: 30,),
          ],
        ),
        body:Padding(
          padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
          child: Column(
            children: [
              Column(
                children: [
                  Center(
                    child: ClipOval(
                      child: userProvider.profilePicture != null &&
                          userProvider.profilePicture!.isNotEmpty
                          ? (userProvider.profilePicture!.startsWith('http')
                          ? Image.network(
                        userProvider.profilePicture!,
                        width: 82,
                        height: 82,
                        fit: BoxFit.cover,
                      )
                          : Image.file(
                        File(userProvider.profilePicture!),
                        width: 82,
                        height: 82,
                        fit: BoxFit.cover,
                      ))
                          : Image.asset(
                        'Assets/images/profileimage.jpg',
                        width: 82,
                        height: 82,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),


                  const SizedBox(height: 10),

                  Text(
                    userProvider.name ?? 'No Name',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Raleway',
                      color: Color(0xFF292929),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    userProvider.email ?? 'No Email',
                    style: const TextStyle(
                      fontSize: 11.11,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Raleway',
                      color: Color(0xFF339D44),
                    ),
                  ),

                ],),

              SizedBox(height: 18,),

              Center(
                child: SizedBox(
                  height: 40,
                  width: 170,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => edit_profile()),
                        );
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("Assets/images/edit.png", width: 24, height: 24,),
                          SizedBox(width: 10,),
                          Text("Edit Profile")

                        ],
                      )
                  ),
                ),
              ),
              SizedBox(height: 32,),

              // part 2

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Stats", style: TextStyle(fontSize: 13.33,fontWeight:
                  FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => bottomnavbar()),
                      );
                    },
                    child: Text("See Dashboard", style: TextStyle(fontSize: 9.26,fontWeight:
                    FontWeight.w500,fontFamily: 'Raleway',color: Color(0xFF339D44),),),
                  ),
                ],
              ),
              SizedBox(height: 10,),

              // part3

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [

                    Container(
                      height: 40,
                      width: 119,
                      child: Text("252 Answered",  textAlign: TextAlign.center ,style: TextStyle(fontSize: 11.11,fontWeight:
                      FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                    ),
                    SizedBox(width: 9,),

                    Container(
                      height: 40,
                      width: 119,
                      child: Text("71 Pending", textAlign: TextAlign.center ,style: TextStyle(fontSize: 11.11,fontWeight:
                      FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                    ),
                    SizedBox(width: 9,),

                    Container(
                      height: 40,
                      width: 119,
                      child: Text("14 Video upload",textAlign: TextAlign.center , style: TextStyle(fontSize: 11.11,fontWeight:
                      FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                    ),

                  ],),
              ),
              SizedBox(height: 20,),

              //part 4

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ratings & Reviews",textAlign: TextAlign.center , style: TextStyle(fontSize: 13.13,fontWeight:
                  FontWeight.w800,fontFamily: 'Raleway',color: Color(0xFF292929),),),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => review_rating()),
                      );
                    },
                    child: Text("See All",textAlign: TextAlign.center , style: TextStyle(fontSize: 9.26,fontWeight:
                    FontWeight.w400,fontFamily: 'Raleway',color: Color(0xFF339D44),),),
                  ),

                ],

              ),
              SizedBox(height: 24,),

              //last part

              Expanded(
                child: ListView.builder(
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    final review = reviews[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 48),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          CircleAvatar(
                            backgroundImage: AssetImage(review.image),
                            radius: 20,
                          ),
                          const SizedBox(width: 12),


                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          review.name,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Raleway',
                                            color: Color(0xFF292929),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          DateFormat("dd MMM, hh:mm a")
                                              .format(review.time.toDate()),
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Color(0xFFB4B4B4),
                                          ),
                                        ),
                                      ],
                                    ),


                                    Row(
                                      children: List.generate(review.starCount, (i) {
                                        return const Icon(
                                          Icons.star_border,
                                          color: Color(0xFF339D44),
                                          size: 16,
                                        );
                                      }),
                                    )
                                  ],
                                ),

                                const SizedBox(height: 6),


                                Text(
                                  review.comment,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF292929),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )



            ],
          ),
        )
    );
  }
}
 