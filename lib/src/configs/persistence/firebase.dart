import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

final firebaseAnalyticsProvider = Provider(
  (ref) => FirebaseAnalytics.instance,
);
