import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mega_show/roots/home_roots/favorite_screen.dart';
import 'package:mega_show/roots/secondry_roots/setting_screen.dart';
import 'package:slide_drawer/slide_drawer.dart';
import 'bloc/app_cubit/app_cubit.dart';
import 'bloc/bloc_observer.dart';
import 'layouts/home_layout.dart';
import 'shared/styles/themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getToken()
        ..getPopularMovies()
        ..getUpComing()
        ..getNewMovies()
        ..getTopRatedMovies()
      ,
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightMode(),
            darkTheme: darkMode(),
            themeMode: AppCubit.get(context).darkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            home: Builder(
              builder: (context) {
                if (MediaQuery.of(context).size.width.toInt() <= 400|| MediaQuery.of(context).size.width.toInt() <= 843) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(
                      textScaleFactor: 0.8,
                    ),
                    child: SlideDrawer(
                      headDrawer: Image.asset(
                        'assets/images/clapperboard.jpg',
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                      brightness: Brightness.dark,
                      offsetFromRight: 240.0,
                      backgroundGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [12, 36, 94],
                        colors: [
                          HexColor('#006992'),
                          HexColor('#0184b7'),
                          HexColor('#00b7ff'),
                        ],
                      ),
                      alignment: SlideDrawerAlignment.start,
                      items: [
                        MenuItem(
                          'Home',
                          icon: Icons.home,
                          onTap: () {},
                        ),
                        MenuItem('Favourite', icon: Icons.favorite_border,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          FavoriteScreen()));
                            }),
                        MenuItem('Profile',
                            icon: Icons.person_outline, onTap: () {}),
                        MenuItem('Setting', icon: Icons.settings, onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SettingScreen()));
                        }),
                      ],
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        child: HomeLayout(),
                      ),
                    ),
                  );
                }
                return SlideDrawer(
                  headDrawer: Image.asset(
                    'assets/images/clapperboard.jpg',
                    height: 200.0,
                    fit: BoxFit.cover,
                  ),
                  brightness: Brightness.dark,
                  offsetFromRight: 240.0,
                  backgroundGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [12, 49, 89],
                    colors: [
                      HexColor('#006992'),
                      HexColor('#0184b7'),
                      HexColor('#00b7ff'),
                    ],
                  ),
                  alignment: SlideDrawerAlignment.start,
                  items: [
                    MenuItem(
                      'Home',
                      icon: Icons.home,
                      onTap: () {},
                    ),
                    MenuItem('Favourite', icon: Icons.favorite_border,
                        onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  FavoriteScreen()));
                    }),
                    MenuItem('Profile',
                        icon: Icons.person_outline, onTap: () {}),
                    MenuItem('Setting', icon: Icons.settings, onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SettingScreen()));
                    }),
                  ],
                  child: HomeLayout(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

