import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql/client.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/collection/application/create_collection_service.dart';

part 'create_collection_event.dart';
part 'create_collection_state.dart';

class CreateCollectionBloc
    extends Bloc<CreateCollectionEvent, CreateCollectionState> {
  CreateCollectionBloc({required this.createCollectionUseCase})
      : super(CreateCollectionState(
          hintText: Assets.createCollectionHints.pickRandomly()!,
        )) {
    on<CreateCollectionTitleChanged>(_onTitleChanged);
    on<CreateCollectionSubmitted>(_onSubmitted);
  }

  final CreateCollectionUseCase createCollectionUseCase;

  void _onTitleChanged(
    CreateCollectionTitleChanged event,
    Emitter<CreateCollectionState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  Future<void> _onSubmitted(
    CreateCollectionSubmitted event,
    Emitter<CreateCollectionState> emit,
  ) async {
    emit(state.copyWith(status: CreateCollectionStatus.loading));

    try {
      // 제목을 입력하지 않아도 테마를 만들 수 있어요.
      var title = state.title;
      if (state.title.isEmpty) title = state.hintText;

      await createCollectionUseCase.execute((title: title));

      emit(state.copyWith(status: CreateCollectionStatus.success));
    } on GraphQLError catch (err) {
      emit(state.copyWith(
        status: CreateCollectionStatus.failure,
        errorMessage: err.message,
      ));
    } catch (err) {
      emit(state.copyWith(
        status: CreateCollectionStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }
}
