class TrendinggModel {
  final String title;
  final String subtitle;
  final String uploadtime;
  final List<String> menuoptions;
  final String? imagePath;
  final String views;
  final String viewsiamge;
  final String comments;
  final String commentimage;


  TrendinggModel({
    required this.title,
    required this.subtitle,
    required this.uploadtime,
    required this.menuoptions,
    this.imagePath,
    required this.views,
    required this.viewsiamge,
    required this.commentimage,
    required this.comments,
  });
}