import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class InfrastructureModule {
  static final firestore = FirebaseFirestore.instance;
  static final storage = FirebaseStorage.instance;
  static final auth = FirebaseAuth.instance;
  static final googleSignIn = GoogleSignIn();
}
