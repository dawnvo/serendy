sealed class CoreException implements Exception {
  const CoreException(this.message);
  final String message;

  @override
  String toString() => "$runtimeType: $message";
}

/// 잘못된 요청이에요.
final class BadRequestException extends CoreException {
  const BadRequestException() : super('Bad request');
}

/// 접근 권한이 없어요. (인증이 필요해요)
final class UnauthorizedException extends CoreException {
  const UnauthorizedException() : super('Unauthorized error');
}

/// 인증에 실패했어요.
final class WrongCredentialsException extends CoreException {
  const WrongCredentialsException() : super('Wrong Credentials');
}

/// 접근 권한이 없어요.
final class AccessDeniedException extends CoreException {
  const AccessDeniedException() : super('Access denied');
}

/// 서버에 에러가 발생했어요.
final class InternalException extends CoreException {
  const InternalException() : super('Internal error');
}

/// 엔티티를 찾을 수 없어요.
final class EntityNotFoundException extends CoreException {
  const EntityNotFoundException({String? overrideMessage})
      : super(overrideMessage ?? 'Entity not found');
}

/// 엔티티가 이미 존재해요.
final class EntityAlreadyExistsException extends CoreException {
  const EntityAlreadyExistsException({String? overrideMessage})
      : super(overrideMessage ?? 'Entity already exists');
}

/// 엔티티 타입 검증에 실패했어요.
final class EntityValidationException extends CoreException {
  const EntityValidationException({String? overrideMessage})
      : super(overrideMessage ?? 'Entity validation error');
}
