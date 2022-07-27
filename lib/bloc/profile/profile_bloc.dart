import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/profile.dart';
import '../../networks/profile_request.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
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
}
