import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_show/bloc/app_cubit/app_cubit.dart';
import 'package:mega_show/shared/styles/colors.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Builder(
          builder: (BuildContext context){
            if (MediaQuery.of(context).size.width.toInt() <= 400|| MediaQuery.of(context).size.width.toInt() <= 843){
              return MediaQuery(data: MediaQuery.of(context).copyWith(
                textScaleFactor: 0.8,
              ), child: Scaffold(
                appBar: AppBar(
                  title: Text('Settings'),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Card(
                          elevation: 3.0,
                          color: AppCubit.get(context).darkMode
                              ? Colors.black12
                              : Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'Communication',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontSize: 16.0),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'About Us',
                                          style:
                                          Theme.of(context).textTheme.headline6,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Connect Us',
                                          style:
                                          Theme.of(context).textTheme.headline6,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Original Website',
                                          style:
                                          Theme.of(context).textTheme.headline6,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Report a Problem',
                                          style:
                                          Theme.of(context).textTheme.headline6,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          elevation: 3.0,
                          color: AppCubit.get(context).darkMode
                              ? Colors.black12
                              : Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'General',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontSize: 16.0),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(_createRoute());
                                  },
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Language',
                                          style:
                                          Theme.of(context).textTheme.headline6,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Dark Mode',
                                          style:
                                          Theme.of(context).textTheme.headline6,
                                        ),
                                        Container(
                                          height: 30,
                                          child: Switch(
                                            activeColor: MAIN_COLOR,
                                            value: AppCubit.get(context).darkMode,
                                            onChanged: (bool value) =>
                                                AppCubit.get(context)
                                                    .changeThemeMode(value),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Card(
                          elevation: 3.0,
                          color: AppCubit.get(context).darkMode
                              ? Colors.black12
                              : Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    'Share Us',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontSize: 16.0),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Share Us on Facebook',
                                          style:
                                          Theme.of(context).textTheme.headline6,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Share Us on Instagram',
                                          style:
                                          Theme.of(context).textTheme.headline6,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Share Us via SMS',
                                          style:
                                          Theme.of(context).textTheme.headline6,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
            }
            return Scaffold(
              appBar: AppBar(
                title: Text('Settings'),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Card(
                        elevation: 3.0,
                        color: AppCubit.get(context).darkMode
                            ? Colors.black12
                            : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Communication',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: 16.0),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'About Us',
                                        style:
                                        Theme.of(context).textTheme.headline6,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Connect Us',
                                        style:
                                        Theme.of(context).textTheme.headline6,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Original Website',
                                        style:
                                        Theme.of(context).textTheme.headline6,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20.0,
                                      )
                                    ],
                                  ),
                                ),
                                onTap: () {},
                              ),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Report a Problem',
                                        style:
                                        Theme.of(context).textTheme.headline6,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        elevation: 3.0,
                        color: AppCubit.get(context).darkMode
                            ? Colors.black12
                            : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'General',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: 16.0),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(_createRoute());
                                },
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Language',
                                        style:
                                        Theme.of(context).textTheme.headline6,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Dark Mode',
                                        style:
                                        Theme.of(context).textTheme.headline6,
                                      ),
                                      Container(
                                        height: 30,
                                        child: Switch(
                                          activeColor: MAIN_COLOR,
                                          value: AppCubit.get(context).darkMode,
                                          onChanged: (bool value) =>
                                              AppCubit.get(context)
                                                  .changeThemeMode(value),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        elevation: 3.0,
                        color: AppCubit.get(context).darkMode
                            ? Colors.black12
                            : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'Share Us',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(fontSize: 16.0),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Share Us on Facebook',
                                        style:
                                        Theme.of(context).textTheme.headline6,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Share Us on Instagram',
                                        style:
                                        Theme.of(context).textTheme.headline6,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Share Us via SMS',
                                        style:
                                        Theme.of(context).textTheme.headline6,
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20.0,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const LanguagesPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.fastLinearToSlowEaseIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class LanguagesPage extends StatelessWidget {
  const LanguagesPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Builder(
          builder: (BuildContext context){
            if (MediaQuery.of(context).size.width.toInt() <= 400|| MediaQuery.of(context).size.width.toInt() <= 843){
              return MediaQuery(data: MediaQuery.of(context).copyWith(
                textScaleFactor: 0.8,
              ), child: Scaffold(
                  appBar: AppBar(
                    title: Text('Languages'),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView(
                      padding: EdgeInsetsDirectional.all(10.0),
                      children: [
                        ListTile(title: Text(
                          'English',
                          style: Theme.of(context).textTheme.headline6,
                        ),),
                        ListTile(title: Text(
                          'Arabic',
                          style: Theme.of(context).textTheme.headline6,
                        ),),
                        ListTile(title: Text(
                          'italy',
                          style: Theme.of(context).textTheme.headline6,
                        ),),
                        ListTile(title: Text(
                          'Chains',
                          style: Theme.of(context).textTheme.headline6,
                        ),)
                      ],
                    ),
                  )
              ));
            }
            return Scaffold(
                appBar: AppBar(
                  title: Text('Languages'),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView(
                    padding: EdgeInsetsDirectional.all(10.0),
                    children: [
                      ListTile(title: Text(
                        'English',
                        style: Theme.of(context).textTheme.headline6,
                      ),),
                      ListTile(title: Text(
                        'Arabic',
                        style: Theme.of(context).textTheme.headline6,
                      ),),
                      ListTile(title: Text(
                        'italy',
                        style: Theme.of(context).textTheme.headline6,
                      ),),
                      ListTile(title: Text(
                        'Chains',
                        style: Theme.of(context).textTheme.headline6,
                      ),)
                    ],
                  ),
                )
            );
          },
        );
      },
    );
  }
}
