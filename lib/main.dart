import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_app/blocs/news/news_bloc.dart';
import 'package:my_app/blocs/profile/profile_bloc.dart';
import 'package:my_app/screens/category/category_screen.dart';
import 'package:my_app/screens/detail/detail.dart';
import 'package:my_app/screens/map/user_map.dart';
import 'package:my_app/screens/newsWidget/news_widget.dart';
import 'package:my_app/screens/profile/profile.dart';
import 'package:my_app/screens/search/search.dart';
import 'package:my_app/screens/suggest_follow/suggest.dart';
import 'package:my_app/screens/tabScreens.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/trending/news_trending_bloc.dart';
import 'screens/trending/trending_screen.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());
  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widgets is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(create: (_) => ProfileBloc()),
        BlocProvider<NewsBloc>(create: (_) => NewsBloc()),
        BlocProvider(create: (_) => NewsTrendingBloc()),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        // home: const News(),
        routes: {
          '/': (ctx) => TabsScreen(),
          DetailPage.routeName: (ctx) => DetailPage(),
          TrendingScreen.routeName: (ctx) => TrendingScreen(),
          News.routeName: (ctx) => News(),
          Search.routeName: (ctx) => Search(),
          Profile.routeName: (ctx) => Profile(),
          SuggestFollow.routeName: (ctx) => SuggestFollow(),
          UserMap.routeName: (ctx) => UserMap()
        },
        onGenerateRoute: (settings) {
          print(settings.arguments);
          return null;
          // if (settings.name == '/meal-detail') {
          //   return ...;
          // } else if (settings.name == '/something-else') {
          //   return ...;
          // }
          // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
            builder: (ctx) => CategoryScreen(),
          );
        },
      ),
    );
  }
}
