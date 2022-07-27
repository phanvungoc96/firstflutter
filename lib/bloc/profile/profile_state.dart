part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final String name;
  final String urlImg;
  ProfileLoaded(this.name, this.urlImg);
}

class ProfileError extends ProfileState {}
