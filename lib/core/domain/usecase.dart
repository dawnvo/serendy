abstract class UseCase<TUseCasePort, TUseCaseResult> {
  Future<TUseCaseResult> execute(TUseCasePort payload);
}

abstract class StreamUseCase<TUseCasePort, TUseCaseResult> {
  Stream<TUseCaseResult> execute(TUseCasePort payload);
}
