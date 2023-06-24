abstract class UseCase<TUseCasePayload, TUseCaseResult> {
  Future<TUseCaseResult> execute(TUseCasePayload payload);
}

abstract class StreamUseCase<TUseCasePayload, TUseCaseResult> {
  Stream<TUseCaseResult> execute(TUseCasePayload payload);
}
