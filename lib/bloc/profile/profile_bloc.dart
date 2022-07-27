import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileLoading()) {
    on<ProfileEvent>((event, emit) async {
      if (event is GetProfile) {
        await Future.delayed(const Duration(seconds: 2));
        emit(ProfileLoaded(
          'Lương Chí Hào',
          'https://i.pinimg.com/736x/dd/56/f8/dd56f888c5abbdc8b429afa07131d418.jpg',
        ));
      }
    });
  }
}
