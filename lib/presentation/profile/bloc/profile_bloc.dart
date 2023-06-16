import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql/client.dart';
import 'package:serendy/features/collection/application/get_collections_list_service.dart';
import 'package:serendy/features/collection/domain/collection.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.getCollectionsListUseCase})
      : super(const ProfileInitial()) {
    on<ProfileMyCollectionsListFetched>(_onMyCollectionsListFetched);
  }

  final GetCollectionsListUseCase getCollectionsListUseCase;

  Future<void> _onMyCollectionsListFetched(
    ProfileMyCollectionsListFetched event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      final collections =
          await getCollectionsListUseCase.execute((ownerId: ''));

      emit(ProfileLoaded(collections: collections));
    } on GraphQLError catch (err) {
      emit(ProfileError(err.message));
    } catch (err) {
      emit(ProfileError(err.toString()));
    }
  }
}
