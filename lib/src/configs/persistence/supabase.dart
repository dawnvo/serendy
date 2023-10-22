import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide Provider;

final supabaseProvider = Provider((ref) => Supabase.instance.client);

final supabaseAdminProvider = Provider((ref) => SupabaseClient(
      dotenv.env['SUPABASE_URL']!,
      dotenv.env['SUPABASE_ROLE_KEY']!,
    ));
