import 'package:findit/feature/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuth;

  FirebaseAuthService({required this.firebaseAuth});
  Future<UserModel> createUserWithEmailAndPassword({
    required String emailAddress,
    required String password,
    required String name,
  }) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      final firebaseUser = credential.user!;
      await firebaseUser.updateDisplayName(name);
      return UserModel.fromFirebaseUser(firebaseUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Exception('The account already exists for that email.');
      }
      throw Exception(e.message ?? 'An unknown error occurred.');
    }
  }

  Future<UserModel> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await firebaseAuth.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      final firebaseUser = credential.user!;
      return UserModel.fromFirebaseUser(firebaseUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
      throw Exception(e.message ?? 'An unknown error occurred.');
    }
  }
}
