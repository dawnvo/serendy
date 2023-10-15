import 'dart:io';

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
      image: profile.image,
    ).toJson();
    return supabase //
        .from(_tableProfiles)
        .insert(entity);
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
      image: profile.image,
    ).toJson();
    return supabase //
        .from(_tableProfiles)
        .update(entity)
        .eq('id', profile.id);
  }

  /**
   * 이미지를 업로드해요.
   */
  @override
  Future<String?> uploadProfileImage(
    Profile profile,
  ) async {
    // * 이미지가 존재하는지 확인해요.
    if (profile.image == null || profile.image == '') return null;

    // * 파일이 존재하는지 확인해요.
    final imageFile = File(profile.image!);
    if (!await imageFile.exists()) return null;

    // * 이미지를 업로드해요.
    final imagePath = profile.id;
    await supabase.storage //
        .from(_tableProfiles)
        .upload(
          imagePath,
          imageFile,
          fileOptions: const FileOptions(upsert: true),
        );

    // * 이미지 주소를 가져와요.
    final imageUrl = supabase.storage //
        .from(_tableProfiles)
        .getPublicUrl(imagePath);

    // * 이미지 주소에 타임스탬프를 추가해
    // * 변경을 (캐싱이) 감지할 수 있도록 해요.
    return addTimestampToUrl(imageUrl);
  }

  /**
   * 업로드한 이미지를 삭제해요.
   */
  @override
  Future<void> deleteProfileImage(
    Profile profile,
  ) async {
    // * 이미지가 존재하는지 확인해요.
    if (profile.image == null || profile.image == '') return;

    // * 업로드한 이미지를 삭제해요.
    final imagePath = profile.id;
    await supabase.storage //
        .from(_tableProfiles)
        .remove([imagePath]);
  }
}
