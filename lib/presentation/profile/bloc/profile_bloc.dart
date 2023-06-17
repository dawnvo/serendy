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
  }

  final CollectionRepository collectionRepository;

  Future<void> _onMyCollectionsListFetched(
    Profile$MyCollectionsListFetched event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final collections = await collectionRepository.fetchCollectionsList(
        ownerId: '01H32VTAB65FMME5N8HMDT70GY',
      );

      emit(ProfileLoaded(collections: collections));
    } catch (err) {
      emit(ProfileError(err.toString()));
    }
  }
}
