
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internshipproject11/models/UserModel.dart';


class UserService {
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  Future createUser(UserModel model) async {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection('users').doc();

    return await FirebaseFirestore.instance
        .collection('users')
        .doc(documentReference.id)
        .set(model.toJson()..['docId'] = documentReference.id);
  }

}
