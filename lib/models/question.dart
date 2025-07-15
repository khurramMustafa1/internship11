class QuestionModel {
  final String name;
  final String time;
  final String question;
  final String avatarPath;
  final List<String>? imagePath;

  QuestionModel({
    required this.name,
    required this.time,
    required this.question,
    required this.avatarPath,
    this.imagePath,
  });
}