import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'GOOGLE_CLIENT_ID_IOS', obfuscate: true)
  static final String googleClientIdIos = _Env.googleClientIdIos;

  @EnviedField(varName: 'GOOGLE_CLIENT_ID_WEB', obfuscate: true)
  static final String googleClientIdWeb = _Env.googleClientIdWeb;

  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static final String supabaseUrl = _Env.supabaseUrl;

  @EnviedField(varName: 'SUPABASE_KEY', obfuscate: true)
  static final String supabaseKey = _Env.supabaseKey;

  @EnviedField(varName: 'SUPABASE_ROLE_KEY', obfuscate: true)
  static final String supabaseRoleKey = _Env.supabaseRoleKey;
}
