import 'package:DozerOwner/core/errors/failures.dart';
import 'package:DozerOwner/core/usecases/usecase.dart';
import 'package:DozerOwner/features/owner_profile/domain/entities/user_entity.dart';
import 'package:DozerOwner/features/owner_profile/domain/usecases/edit_user_profile_usecase.dart';
import 'package:DozerOwner/features/owner_profile/domain/usecases/get_user_profile_usecase.dart';
import 'package:DozerOwner/features/owner_profile/presentation/blocs/profile_event.dart';
import 'package:DozerOwner/features/owner_profile/presentation/blocs/profile_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUser getUser;
  final EditUserProfile editUserProfile;
  ProfileBloc({required this.editUserProfile, required this.getUser})
      : super(ProfileInitialState()) {
    on<GetProfileEvent>(_loadUser);
    on<EditProfileEvent>(_editUser);
    on<EditProfilePictureEvent>(_upLoadImage);
  }
  void _loadUser(GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    final result = await getUser(NoParams());
    emit(_loadingSucessOrFailure(result));
  }

  void _editUser(EditProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileSavingState());
    final result = await editUserProfile(event.user);
    emit(_updatingSucessOrFailure(result));
  }

  void _upLoadImage(
      EditProfilePictureEvent event, Emitter<ProfileState> emit) async {
    emit(UpLoadingState());
    final result = await editUserProfile(event.user);
    emit(_upLoadingSucessOrFailure(result));
    emit(ProfileLoadingState());
    emit(_loadingSucessOrFailure(result));
  }

  ProfileState _loadingSucessOrFailure(Either<Failure, UserEntity> data) {
    return data.fold(
      (failure) => ProfileFailureState(error: failure),
      (user) => ProfileLoadedState(user: user),
    );
  }

  ProfileState _updatingSucessOrFailure(Either<Failure, UserEntity> data) {
    return data.fold(
      (falure) => ProfileFailureState(error: falure),
      (user) => ProfileSavedState(user: user),
    );
  }

  ProfileState _upLoadingSucessOrFailure(Either<Failure, UserEntity> data) {
    return data.fold(
      (falure) =>UploadingFailureState(error: falure),
      (user) => UpLoadedState(user: user),
    );
  }
}
