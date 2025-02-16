import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String?> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return null;
    } catch (e) {
      handleAuthError(e);
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } catch (e) {
      return handleAuthError(e);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  String handleAuthError(dynamic e) {
    if (e is FirebaseAuthException) {print(e.code);
      switch (e.code.toString()) {

        case 'email-already-in-use':
          return "هذا البريد الإلكتروني مستخدم بالفعل";
        case 'weak-password':
          return "كلمة المرور ضعيفة، اختر كلمة أقوى";
        case 'user-not-found':
          return "لم يتم العثور على مستخدم بهذا البريد الإلكتروني";
        case 'wrong-password':
          return "كلمة المرور غير صحيحة";
        case 'invalid-email':
          return "البريد الإلكتروني غير صحيح";
          case 'invalid-credential':
          return "معلومات تسجيل الدخول غير صحيحة";
        default:
          return "حدث خطأ: ${e.message}";
      }
    }
    return "حدث خطأ غير متوقع: $e";
  }
}
