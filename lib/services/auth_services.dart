import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  //Sign user
  Future<User?> signInWithGoogle() async
  {
    try{

      // google signIn Flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if(googleUser == null)
      {
        return null;
      }


      final GoogleSignInAuthentication? googleAuth= await googleUser.authentication;

      // create new cretinal 
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
       // Sign in to Firebase with the credential
       final UserCredential  userCredential = await _firebaseAuth.signInWithCredential(credential);

      return userCredential.user;

    }catch(e)
    {
     print('Error during Google Sign-In: $e');
     return null;
    }

  }

 
  //function for signup
  
}
