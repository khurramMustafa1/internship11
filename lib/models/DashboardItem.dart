class homemodel {
  final String image;
  final String title;
  final String subtitle;
  final double imageWidth;
  final double imageHeight;

  homemodel({
    required this.image,
    required this.title,
    required this.subtitle,
    this.imageWidth = 19.66,  // default width
    this.imageHeight = 32.54, // default height
  });
}