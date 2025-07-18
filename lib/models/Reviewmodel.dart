import 'package:flutter/cupertino.dart';

class RatingReviewModel {
  final String image;
  final String name;
  final String time;
  final String comment;
  final IconData iconStar; // icon to display
  final int starCount;     // number of stars

  RatingReviewModel({
    required this.image,
    required this.name,
    required this.time,
    required this.comment,
    required this.iconStar,
    required this.starCount,
  });
}