import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

final supabaseProvider = Provider((ref) => Supabase.instance.client);
