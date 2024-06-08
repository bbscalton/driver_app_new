import 'package:firebase_auth/firebase_auth.dart';
import 'package:driver_app_new/models/user.dart' as AppUser;

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<AppUser.User?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((User? user) {
      return user != null
          ? AppUser.User(uid: user.uid, email: user.email!)
          : null;
    });
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<AppUser.User?> signInWithEmailAndPassword(
      String email, String password) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return AppUser.User(
        uid: credential.user!.uid, email: credential.user!.email!);
  }

  Future<AppUser.User?> registerWithEmailAndPassword(
      String email, String password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return AppUser.User(
        uid: credential.user!.uid, email: credential.user!.email!);
  }
}
