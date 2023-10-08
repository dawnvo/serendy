import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/profile/profile.dart';

import 'profile_mapper.dart';

final class ProfileRepositoryImpl implements ProfileRepository {
  const ProfileRepositoryImpl(this.supabase);
  final SupabaseClient supabase;

  static const String _tableProfiles = TablePath.profiles;

  /**
   * 프로필을 불러와요.
   */
  @override
  Future<Profile?> fetchProfile({
    required UserID id,
  }) {
    const columns = '*';
    return supabase
        .from(_tableProfiles)
        .select(columns)
        .eq('id', id)
        .maybeSingle()
        .withConverter(ProfileMapper.toSingle);
  }

  /**
   * 프로필을 만들어요.
   */
  @override
  Future<void> createProfile(
    Profile profile,
  ) {
    final entity = ProfileEntity(
      id: profile.id,
      name: profile.name,
      email: profile.email,
      avatar: profile.avatar,
    );
    return supabase //
        .from(_tableProfiles)
        .insert(entity.toJson());
  }

  /**
   * 프로필을 갱신해요.
   */
  @override
  Future<void> updateProfile(
    Profile profile,
  ) {
    final entity = ProfileEntity(
      name: profile.name,
      email: profile.email,
      avatar: profile.avatar,
    );
    return supabase //
        .from(_tableProfiles)
        .update(entity.toJson())
        .eq('id', profile.id);
  }
}
