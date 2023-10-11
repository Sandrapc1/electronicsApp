// ignore_for_file: avoid_print, use_rethrow_when_possible
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final _auth= FirebaseAuth.instance;
  final _googleSign =GoogleSignIn();

  signinWithGoogle()async{
  try {
    final GoogleSignInAccount ? googleSignInAccount=await _googleSign.signIn();
    if (googleSignInAccount !=null) {
      final GoogleSignInAuthentication googleSignInAuthentication=
      await googleSignInAccount.authentication;
       final AuthCredential authCredential= GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken
      );
      await _auth.signInWithCredential(authCredential);
    }
  } on FirebaseAuthException catch (e) {
   print(e.message);
   throw e; 
  }
  }

    signOut()async{
    await _auth.signOut();
    await GoogleSignIn().signOut();
   }
}