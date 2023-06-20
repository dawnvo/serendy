import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:serendy/core/locator.dart';

abstract final class DataModule {
  DataModule._();

  static void dependencies() {
    sl.registerSingleton<GoogleSignIn>(
      GoogleSignIn(),
    );
    sl.registerSingleton<FirebaseAuth>(
      FirebaseAuth.instance,
    );
    sl.registerSingleton<FirebaseFirestore>(
      FirebaseFirestore.instance,
    );
    sl.registerSingleton<FirebaseStorage>(
      FirebaseStorage.instance,
    );
  }
}
