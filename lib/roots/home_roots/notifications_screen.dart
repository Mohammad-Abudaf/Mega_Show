import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_show/bloc/app_cubit/app_cubit.dart';
import 'package:mega_show/bloc/app_cubit/app_cubit.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(AppCubit.get(context).userLoggedIn){
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ':D',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 30.0),
                ),
                Text(
                  "Good job! Looks like you're all caught",
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 20.0),
                ),
              ],
            ),
          );
        }
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ':(',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 30.0),
              ),
              Text(
                "You Have To Login First!",
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 30.0),
              ),
            ],
          ),
        );
      },
    );
  }
}
