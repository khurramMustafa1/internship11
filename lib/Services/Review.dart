import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internshipproject11/models/review.dart';
class RatingReviewService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = "rating&reviews"; // your collection name

  // ✅ Get all reviews
  Future<List<RatingReviewModels>> getReviews() async {
    try {
      QuerySnapshot snapshot = await _firestore.collection(_collection).get();

      return snapshot.docs.map((doc) {
        return RatingReviewModels.fromJson(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      print("Error fetching reviews: $e");
      return [];
    }
  }
}