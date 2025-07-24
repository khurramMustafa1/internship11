import 'package:firebase_auth/firebase_auth.dart';
class AuthServies{
  Future<User?> signupUser({required String email, required String password })
  async {
    UserCredential userCredential=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    await userCredential.user!.sendEmailVerification();
    return userCredential.user;
  }
  Future<User?> loginUser({required String email, required String password})
  async{
    UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  //forgot password

  Future forgotpassword (String email) async{
    return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

  }

}
