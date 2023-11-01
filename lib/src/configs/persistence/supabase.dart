import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

final supabaseProvider = FutureProvider(
  (ref) => Supabase.initialize(
    url: dotenv.env['SUPABASE_URL'] as String,
    anonKey: dotenv.env['SUPABASE_KEY'] as String,
    debug: kDebugMode,
  ),
);

final supabaseClientProvider = Provider(
  (ref) => ref.watch(supabaseProvider).requireValue.client,
);

final supabaseAdminProvider = Provider(
  (ref) => SupabaseClient(
    dotenv.env['SUPABASE_URL'] as String,
    dotenv.env['SUPABASE_ROLE_KEY'] as String,
  ),
);
