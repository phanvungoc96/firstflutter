import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/profile/profile_bloc.dart';
import 'package:my_app/screens/newsWidget/widget/follow_widget.dart';

class TheoDoiPager extends StatelessWidget {
  const TheoDoiPager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(225, 224, 229, 1),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileError) {
            final snackBar = SnackBar(
              content: Text(state.ms),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          if (state is ProfileLoaded) {
            return FollowWidget(isLogedIn: true);
          } else {
            return FollowWidget();
          }
        },
      ),
    );
  }
}
