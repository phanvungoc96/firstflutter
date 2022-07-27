part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileModel profileModel;
  ProfileLoaded(this.profileModel);
}

class ProfileError extends ProfileState {
  final String ms;
  ProfileError(this.ms);
}
