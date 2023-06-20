import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/configs/configs.dart';
import 'package:serendy/features/collection/collection.dart';

part 'create_collection_event.dart';
part 'create_collection_state.dart';

class CreateCollectionBloc
    extends Bloc<CreateCollectionEvent, CreateCollectionState> {
  CreateCollectionBloc({required this.collectionService})
      : super(CreateCollectionState(
          hintText: Assets.createCollectionHints.pickRandomly()!,
        )) {
    on<CreateCollection$TitleChanged>(_onTitleChanged);
    on<CreateCollection$Submitted>(_onSubmitted);
  }

  final CollectionService collectionService;

  void _onTitleChanged(
    CreateCollection$TitleChanged event,
    Emitter<CreateCollectionState> emit,
  ) {
    emit(state.copyWith(title: event.title));
  }

  Future<void> _onSubmitted(
    CreateCollection$Submitted event,
    Emitter<CreateCollectionState> emit,
  ) async {
    emit(state.copyWith(status: CreateCollectionStatus.loading));

    try {
      // 제목을 입력하지 않아도 테마를 만들 수 있어요.
      var title = state.title;
      if (state.title.isEmpty) title = state.hintText;

      await collectionService.createCollection(title: title);

      emit(state.copyWith(status: CreateCollectionStatus.success));
    } catch (err) {
      emit(state.copyWith(
        status: CreateCollectionStatus.failure,
        errorMessage: err.toString(),
      ));
    }
  }
}
