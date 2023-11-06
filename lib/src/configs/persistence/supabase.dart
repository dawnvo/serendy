import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;
import 'package:serendy/env.dart';

final supabaseClientProvider = Provider(
  (ref) => Supabase.instance.client,
);

final supabaseAdminProvider = Provider(
  (ref) => SupabaseClient(
    Env.supabaseUrl,
    Env.supabaseRoleKey,
  ),
);
