import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DialogTest extends StatelessWidget {
  DialogTest({super.key});

  final TextEditingController controller = TextEditingController();

  

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      // Obtain auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("Error signing in: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              UserCredential? user = await signInWithGoogle();
              if (user != null) {
                print("Signed in as: ${user.user?.displayName}");
              } else {
                print("Sign in failed");
              }
            },
            child: Text("Google Sign in"),
          ),
        ),
      ),
    );
  }
}
