import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

final firebaseAnalyticsProvider = Provider(
  (ref) => FirebaseAnalytics.instance,
);

final firebaseRemoteConfigProvider = Provider(
  (ref) => FirebaseRemoteConfig.instance,
);
