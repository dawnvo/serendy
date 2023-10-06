import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/profile/profile.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
UserID? currentUserId(CurrentUserIdRef ref) {
  final auth = ref.watch(supabaseProvider.select((_) => _.auth));
  return auth.currentUser?.id;
}

@Riverpod(keepAlive: true)
UserID requireUserId(RequireUserIdRef ref) {
  final userId = ref.watch(currentUserIdProvider);
  if (userId == null) throw const UnauthorizedException();
  return userId;
}
