import 'package:google_sign_in/google_sign_in.dart';
import 'package:serendy/src/features/auth/infrastructure/auth_repository_impl.dart';
import 'package:serendy/src/configs/configs.dart';

part 'auth_module.g.dart';

@Riverpod(keepAlive: true)
AuthRepositoryImpl authRepository(AuthRepositoryRef ref) {
  final supabase = ref.watch(supabaseClientProvider);
  final googleSignIn = GoogleSignIn();
  return AuthRepositoryImpl(supabase, googleSignIn);
}
