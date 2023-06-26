import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serendy/src/configs/configs.dart';
import 'package:serendy/src/features/auth/auth.dart';
import 'package:serendy/src/features/user/user.dart';

part 'account_state.dart';
part 'account_controller.g.dart';

@riverpod
class AccountController extends _$AccountController with NotifierMounted {
  @override
  FutureOr<AccountState> build() async {
    ref.onDispose(setUnmounted);

    final userId = ref.watch(requireUserIdProvider);
    final user = await ref.watch(fetchUserProvider(id: userId).future);

    return AccountState(
      initialUser: user,
      avatar: user.avatar,
      name: user.name,
      email: user.email,
    );
  }

  /// 이미지를 변경해요.
  void changeAvatar(String? imagePath) {
    state = AsyncData(state.requireValue.copyWith(avatar: imagePath));
  }

  /// 이름을 수정해요.
  void changeName(String name) {
    state = AsyncData(state.requireValue.copyWith(name: name));
  }

  /// 프로필을 수정해요.
  Future<void> submit(BuildContext context) async {
    state = const AsyncLoading();

    final newState = await AsyncValue.guard(() async {
      final user = await ref.read(editProfileProvider(
        avatar: state.requireValue.avatar,
        username: state.requireValue.name,
      ).future);

      return state.requireValue.copyWith(initialUser: user);
    });

    // * 컨트롤러가 폐기되지 않은 경우에만 상태를 설정해요.
    if (!mounted) return;
    state = newState;
  }

  /// 로그아웃해요.
  Future<void> signOut(BuildContext context) async {
    try {
      await ref.read(authServiceProvider).signOutWithGoogle();

      // * 컨트롤러가 폐기되지 않았고, 에러가 없으면 실행을 계속해요.
      if (!mounted && !state.hasError) return;

      // * 로그아웃에 성공하면 로그인 화면으로 이동해요.
      ref.read(goRouterProvider).goNamed(AppRoutes.signInName);
    } catch (err) {
      // * 로그아웃에 실패하면 메시지로 안내해요.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(err.toString())),
      );
    }
  }
}
