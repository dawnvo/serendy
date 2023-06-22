import 'package:get_it/get_it.dart';
import 'package:serendy/features/auth/application/auth_module.dart';
import 'package:serendy/features/collection/application/collection_module.dart';
import 'package:serendy/features/evaluation/application/evaluation_module.dart';
import 'package:serendy/features/media/application/media_module.dart';
import 'package:serendy/features/user/application/user_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

class AppBinding {
  AppBinding._();

  static void dependencies() {
    DataModule.dependencies();
    AuthModule.dependencies();
    UserModule.dependencies();
    MediaModule.dependencies();
    CollectionModule.dependencies();
    EvaluationModule.dependencies();
  }
}

abstract final class DataModule {
  static void dependencies() {
    sl.registerSingleton(GoogleSignIn());
    sl.registerSingleton(FirebaseAuth.instance);
    sl.registerSingleton(FirebaseFirestore.instance);
    sl.registerSingleton(FirebaseStorage.instance);
  }
}
