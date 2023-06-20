import 'package:graphql/client.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/configs/mixin/graphql_error_handler_mixin.dart';
import 'package:serendy/features/user/data/mapper/user_mapper.dart';
import 'package:serendy/features/user/data/user_repository.dart';
import 'package:serendy/features/user/domain/user.dart';

final class UserRepositoryRemote extends UserRepository
    with GraphqlErrorHandlerMixin {
  UserRepositoryRemote(this._client);
  final GraphQLClient _client;

  @override
  Future<User?> fetchMe() async {
    final result = await guard(() => _client.query$GetMe());
    final data = result.parsedData!.GetMe;
    return UserMapper.toDomain(data);
  }

  @override
  Future<void> signUp({
    required String name,
    required String email,
    String? image,
  }) async {
    await guard(
      () => _client.mutate$SignUp(Options$Mutation$SignUp(
        variables: Variables$Mutation$SignUp(
          name: name,
          email: email,
          image: image,
        ),
      )),
    );
  }

  @override
  Future<void> editUser({
    String? name,
    String? email,
    String? image,
  }) async {
    await guard(
      () => _client.mutate$EditUser(Options$Mutation$EditUser(
        variables: Variables$Mutation$EditUser(
          name: name,
          email: email,
          image: image,
        ),
      )),
    );
  }

  @override
  Future<void> deleteUser(String? reason) async {
    await guard(
      () => _client.mutate$RemoveUser(Options$Mutation$RemoveUser(
        variables: Variables$Mutation$RemoveUser(
          reason: reason,
        ),
      )),
    );
  }
}
