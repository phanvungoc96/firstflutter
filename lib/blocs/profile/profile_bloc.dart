import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/profile.dart';
import '../../networks/profile_request.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends HydratedBloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) async {
      if (event is GetProfile) {
        try {
          emit(ProfileLoading());
          final userProfile = await ProfileRequest.fetchProfiles();
          if (userProfile.isNotEmpty) {
            final random = Random();
            var min = 0;
            var max = userProfile.length - 1;
            var r = min + random.nextInt(max - min);
            emit(ProfileLoaded(userProfile[r]));
          } else {
            throw Exception("Không có dữ liệu");
          }
        } catch (e) {
          emit(ProfileError(e.toString()));
        }
      }
      if (event is Logout) {
        emit(ProfileInitial());
      }
    });
  }

  @override
  ProfileState? fromJson(Map<String, dynamic> json) {
    try {
      final userProfile = ProfileModel.fromJson(json);
      return ProfileLoaded(userProfile);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ProfileState state) {
    if (state is ProfileLoaded) {
      return state.profileModel.toJson();
    } else {
      return null;
    }
  }
}
