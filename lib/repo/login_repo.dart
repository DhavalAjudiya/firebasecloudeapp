import 'package:firebasecludeapp/const/constant.dart';

class LoginRepo {
  static Future<void> emailRegister({String? email, String? pass}) async {
    await kFirebaseAuth
        .createUserWithEmailAndPassword(email: email!, password: pass!)
        .then((value) => print(value.user!.email))
        .catchError((e) => print(e));
  }

  static Future<void> emailLogin({String? email, String? pass}) async {
    await kFirebaseAuth
        .signInWithEmailAndPassword(email: email!, password: pass!)
        .then((value) {
      print('LoginSuccess ${value.user!.email}');
    }).catchError((e) => print('Error $e'));
  }

  static Future<void> currentUser() async {
    print('${kFirebaseAuth.currentUser!.uid}');
    print('${kFirebaseAuth.currentUser?.email}');
    print('${kFirebaseAuth.currentUser?.uid}');
    // kFirebaseAuth
    //     .signInWithEmailLink(
    //         email: 'bordahardik24@gmail.com',
    //         emailLink: 'https://flutterauth.page.link/')
    //     .then((value) => print(value.user.uid))
    //     .catchError((e) => print('ero=$e'));
  }

  static Future<void> logOut() async {
    kFirebaseAuth.signOut();
    print('Log Out');
  }
}
