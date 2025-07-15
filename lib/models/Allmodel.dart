import 'package:flutter/material.dart';

class AllModel {
  final String profileImage;
  final String name;
  final String time;
  final String title;
  final String? contentImage;
  final Widget? answerRoute;

  AllModel({
    required this.profileImage,
    required this.name,
    required this.time,
    required this.title,
    this.contentImage,
    this.answerRoute,
  });
}

class TrainingVideoAllModel {
  final String title;
  final String subtitle;
  final String uploadTime;
  final List<String> menuOptions; // three dot
  final String Image;
  final String viewImage; // image is present with the name of viewimage
  final String views;
  final String commentImage; // image is present with the name of commentimage
  final String comments;
  final Widget? commentPageRoute;

  TrainingVideoAllModel({
    required this.title,
    required this.subtitle,
    required this.uploadTime,
    required this.menuOptions,
    required this.Image,
    required this.viewImage,
    required this.views,
    required this.commentImage,
    required this.comments,
    this.commentPageRoute,

  });
}

class AllComments {
  final String image;
  final String title;
  final String date;
  final String comment;

  AllComments({
    required this.image,
    required this.title,
    required this.date,
    required this.comment,
  });
}