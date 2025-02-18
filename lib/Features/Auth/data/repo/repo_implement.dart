import 'package:book_app/Features/Auth/data/repo/repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImplement implements AuthRepo {
  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }

  @override
  Future<dynamic> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    String? errormessage;
    
    try {
     await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      errormessage =
          "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}";
      if (e.code == 'weak-password') {
        errormessage = 'الرقم السري ضعيف جداً.';
      } else if (e.code == 'email-already-in-use') {
        errormessage = 'لقد قمت بالتسجيل مسبقاً. الرجاء تسجيل الدخول.';
      } else if (e.code == 'network-request-failed') {
        errormessage = 'تأكد من اتصالك بالانترنت.';
      } else {
        errormessage = 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.';
      }
    } catch (e) {
      errormessage =
          "Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}";

      errormessage = 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.';
    }

    return errormessage;
  }

  @override
  Future<dynamic> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    
    String? errormessage;

    try {
      
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      errormessage =
          "Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}";

      if (e.code == 'user-not-found') {
        errormessage = 'الرقم السري او البريد الالكتروني غير صحيح.';
      } else if (e.code == 'wrong-password') {
        errormessage = 'الرقم السري او البريد الالكتروني غير صحيح.';
      } else if (e.code == 'invalid-credential') {
        errormessage = 'الرقم السري او البريد الالكتروني غير صحيح.';
      } else if (e.code == 'network-request-failed') {
        errormessage = 'تأكد من اتصالك بالانترنت.';
      } else {
        errormessage = 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.';
      }
    } catch (e) {
      errormessage =
          "Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}";

      errormessage = 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.';
    }
    return errormessage;
  }

  

 
  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }

}
