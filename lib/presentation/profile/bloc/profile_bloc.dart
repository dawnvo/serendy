import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:serendy/features/collection/data/collection_repository.dart';
import 'package:serendy/features/collection/domain/collection.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.collectionRepository})
      : super(const ProfileInitial()) {
    on<Profile$MyCollectionsListFetched>(_onMyCollectionsListFetched);
    on<Profile$CollectionItemAdded>(_onCollectionItemAdded);
    on<Profile$CollectionItemDeleted>(_onCollectionItemDeleted);
  }

  final CollectionRepository collectionRepository;

  Future<void> _onMyCollectionsListFetched(
    Profile$MyCollectionsListFetched event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileLoading());

    try {
      final collections = await collectionRepository.fetchCollectionsList(
        ownerId: '01H32VTAB65FMME5N8HMDT70GY',
      );

      emit(ProfileLoaded(collections: collections));
    } catch (err) {
      emit(ProfileError(err.toString()));
    }
  }

  Future<void> _onCollectionItemAdded(
    Profile$CollectionItemAdded event,
    Emitter<ProfileState> emit,
  ) async {
    /// 컬렉션을 불러온 후 추가할 수 있어요.
    if (state is ProfileLoaded) {
      try {
        await collectionRepository.addCollectionItem(
          collectionId: event.collectionId,
          mediaId: event.mediaId,
        );

        final collections = (state as ProfileLoaded).collections;
        emit(ProfileLoaded(collections: collections));
      } catch (err) {
        emit(ProfileError(err.toString()));
      }
    }
  }

  Future<void> _onCollectionItemDeleted(
    Profile$CollectionItemDeleted event,
    Emitter<ProfileState> emit,
  ) async {
    /// 컬렉션을 불러온 후 삭제할 수 있어요.
    if (state is ProfileLoaded) {
      try {
        await collectionRepository.deleteCollectionItem(
          collectionId: event.collectionId,
          mediaId: event.mediaId,
        );

        final collections = (state as ProfileLoaded).collections;
        emit(ProfileLoaded(collections: collections));
      } catch (err) {
        emit(ProfileError(err.toString()));
      }
    }
  }
}
