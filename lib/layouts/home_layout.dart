import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_show/bloc/app_cubit/app_cubit.dart';
import 'package:mega_show/roots/secondry_roots/profile_screen.dart';
import 'package:mega_show/roots/secondry_roots/search_screen.dart';
import 'package:mega_show/roots/secondry_roots/setting_screen.dart';
import 'package:mega_show/shared/styles/animation.dart';
import 'package:mega_show/shared/styles/colors.dart';
import 'package:mega_show/shared/widgets/constants.dart';
import 'package:slide_drawer/slide_drawer.dart';

List<String> popUpMenuItems(bool isUserLoggedIn) {
  if (isUserLoggedIn) {
    return ['Profile', 'Settings', 'Logout'];
  }
  return ["Settings", "login"];
}

class HomeLayout extends StatelessWidget {
  HomeLayout({Key? key}) : super(key: key);

  String? _userName = 'moh.sami';
  String? _password = '123456789m';
  var _formKey = new GlobalKey<FormState>();

  void selectDropMenuItem(String? value, BuildContext context, AppState state) {
    if (value == 'Settings') {
      Navigator.of(context).push(createRoute(SettingScreen(),
          motion: Curves.decelerate, dx: 1.0, dy: 0.0));
    }
    else if (value == 'login') {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 20.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'user name:',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 18.0, color: Colors.grey),
                      ),
                    ),
                    TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'email must not be empty!';
                        }
                        return null;
                      },
                      onChanged: (String? value) {
                        _userName = value;
                      },
                      decoration: new InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color:
                                  Theme.of(context).scaffoldBackgroundColor !=
                                          Colors.white
                                      ? Colors.grey
                                      : Colors.white,
                            )),
                        disabledBorder: new OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.black12)),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: MAIN_COLOR)),
                        hintText: 'user name...',
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'password: ',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 18.0, color: Colors.grey),
                      ),
                    ),
                    TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'email must not be empty!';
                        }
                        return null;
                      },
                      onChanged: (String value) {
                        _password = value;
                      },
                      decoration: new InputDecoration(
                        contentPadding: const EdgeInsets.all(3),
                        enabledBorder: new OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color:
                                  Theme.of(context).scaffoldBackgroundColor !=
                                          Colors.white
                                      ? Colors.grey
                                      : Colors.white,
                            )),
                        disabledBorder: new OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.black12)),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: MAIN_COLOR)),
                        hintText: 'password...',
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.orange,
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              _userName = null;
                              _password = null;
                              Navigator.pop(context);
                            },
                            child: const Text("cancel",
                                style: TextStyle(color: Colors.red),),),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              AppCubit.get(context).signInWithEmailAndPassword(
                                  _userName, _password, token);
                                Navigator.pop(context);
                            }
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.orange),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
    else if (value == 'Profile') {
      Navigator.of(context).push(createRoute(ProfileScreen(),
          motion: Curves.decelerate, dx: 1.0, dy: 0.0));
    }
    if (state is AppSignInSuccessfulState) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => SlideDrawer.of(context)?.toggle(),
            ),
            titleSpacing: 40.0,
            title: Text(
              'Mega Show',
              style: TextStyle(
                fontFamily: 'MonteCarlo',
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ),
                    );
                  },
                  icon: Icon(Icons.search)),
              PopupMenuButton(
                onSelected: (String? value) =>
                    selectDropMenuItem(value, context, state),
                icon: Icon(Icons.more_vert_outlined),
                color: AppCubit.get(context).darkMode
                    ? Colors.grey[900]
                    : Colors.white,
                itemBuilder: (BuildContext context) {
                  return popUpMenuItems(AppCubit.get(context).userLoggedIn)
                      .map(
                        (e) => PopupMenuItem(
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: AppCubit.get(context).darkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          value: e,
                        ),
                      )
                      .toList();
                },
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 5.0,
            currentIndex: AppCubit.get(context).screenIndex,
            onTap: (int index) => AppCubit.get(context).changeScreen(index),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: 'favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications_none_rounded),
                  label: 'notifications'),
            ],
          ),
          body:
              AppCubit.get(context).screens[AppCubit.get(context).screenIndex],
        );
      },
    );
  }
}
