import 'package:cal_ai/utils/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServices {


  FirestoreServices() {
    print("FirestoreServices instance created");
  }

  
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<DocumentSnapshot?> fetchUserData() async {
    print("fetch user function");
    try {
      //User? currentUser = _auth.currentUser;
     String? savedId= await CalSharedPreferences.getString('uid');
     // Debug print to confirm UID retrieval
      print("save id----------------->$savedId");
      if (savedId != null && savedId.isNotEmpty ) {
        print("current user-------->$savedId");
       
        

        DocumentSnapshot userDoc =
            await _firestore.collection("userdata").doc(savedId).get();

        return userDoc;
      }
      else{
        print('No user is logged in');
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }
}
