import 'package:serendy/core/exceptions/core_exception.dart';
import 'package:serendy/features/auth/application/auth_service.dart';
import 'package:serendy/features/user/user.dart';
import 'package:serendy/features/user/domain/usecases/create_user_usecase.dart';
import 'package:serendy/features/user/domain/usecases/edit_profile_usecase.dart';
import 'package:serendy/features/user/domain/usecases/get_user_usecase.dart';
import 'package:serendy/features/user/domain/usecases/remove_user_usecase.dart';

class UserService {
  const UserService(
    this._authService,
    this._getUserUsecase,
    this._createUserUsecase,
    this._editProfileUsecase,
    this._removeUserUsecase,
  );

  final AuthService _authService;
  final GetUserUsecase _getUserUsecase;
  final CreateUserUsecase _createUserUsecase;
  final EditProfileUsecase _editProfileUsecase;
  final RemoveUserUsecase _removeUserUsecase;

  /// 내 정보를 불러와요.
  Future<User> fetchMe() async {
    return _getUserUsecase.execute((userId: _userId));
  }

  /// 사용자를 만들어요.
  Future<User> createUser({
    required String authId,
    required String name,
    String? email,
    String? avatar,
  }) async {
    return _createUserUsecase.execute((
      id: authId,
      name: name,
      email: email,
      avatar: avatar,
    ));
  }

  /// 프로필을 수정해요.
  Future<User> editProfile({
    String? name,
    String? avatar,
  }) async {
    return _editProfileUsecase.execute((
      executorId: _userId,
      name: name,
      avatar: avatar,
    ));
  }

  /// 사용자를 제거해요.
  Future<void> removeUser({
    required String id,
    String? reason,
  }) async {
    return _removeUserUsecase.execute((
      executorId: _userId,
      reason: reason,
    ));
  }

  String get _userId {
    final userId = _authService.currentUserId;
    if (userId == null) throw const UnauthorizedException();
    return userId;
  }
}
