import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/user/domain/user.dart';

abstract final class UserMapper {
  static User toDomain(Fragment$UserFields data) {
    return User(
      id: data.id,
      name: data.name,
      email: data.email,
      avatar: data.image,
    );
  }

  static List<User?> toDomains(List<Fragment$UserFields> domains) {
    return domains.map((domain) => toDomain(domain)).toList();
  }
}
