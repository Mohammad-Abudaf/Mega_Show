import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_show/bloc/app_cubit/app_cubit.dart';
import 'package:mega_show/roots/secondry_roots/movie_screen.dart';
import 'package:mega_show/shared/widgets/widgets.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Builder(builder: (BuildContext context){
          if(MediaQuery.of(context).size.width.toInt() <= 400|| MediaQuery.of(context).size.width.toInt() <= 843){
            if (AppCubit.get(context).userLoggedIn) {
              if (AppCubit.get(context).favoriteShows!.isEmpty) {
                return MediaQuery(data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 0.8,
                ), child: Center(
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
                        'No favorite movies',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 30.0),
                      ),
                    ],
                  ),
                ));
              } else {
                return MediaQuery(data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 0.8,
                ), child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: AppCubit.get(context).favoriteShows!.length,
                    itemBuilder: (context, index) {
                      final item =
                      AppCubit.get(context).favoriteShows![index]['id'];
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (direction) {
                          setState(() {
                            AppCubit.get(context).favoriteShows!.remove(
                                AppCubit.get(context).favoriteShows![index]);
                            AppCubit.get(context)
                                .editFavoriteList('movie', item, false);
                          });
                        },
                        background: Container(color: Colors.red),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: BuildSearchItem(
                            movieImage:
                            'https://image.tmdb.org/t/p/w500${AppCubit.get(context).favoriteShows![index]['poster_path']}',
                            movieName:
                            '${AppCubit.get(context).favoriteShows![index]['title']}',
                            movieRate:
                            '${AppCubit.get(context).favoriteShows![index]['vote_average']}',
                            movieCoverImage:
                            'https://image.tmdb.org/t/p/w500${AppCubit.get(context).favoriteShows![index]['backdrop_path']}',
                            movieOverView:
                            '${AppCubit.get(context).favoriteShows![index]['overview']}',
                            movieReviews:
                            '${AppCubit.get(context).favoriteShows![index]['vote_count']}',
                            movieType: AppCubit.get(context).favoriteShows![index]
                            ['adult'],
                            movieId: AppCubit.get(context).favoriteShows![index]
                            ['id'],
                          ),
                        ),
                      );
                    },
                  ),
                ));
              }
            } else {
              return MediaQuery(data: MediaQuery.of(context).copyWith(
                textScaleFactor: 0.8,
              ), child: Center(
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
                      'You Have To Login First!',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 30.0),
                    ),
                  ],
                ),
              ));
            }
          }
          if (AppCubit.get(context).userLoggedIn) {
            if (AppCubit.get(context).favoriteShows!.isEmpty) {
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
                      'No favorite movies',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontSize: 30.0),
                    ),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: AppCubit.get(context).favoriteShows!.length,
                  itemBuilder: (context, index) {
                    final item =
                    AppCubit.get(context).favoriteShows![index]['id'];
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        setState(() {
                          AppCubit.get(context).favoriteShows!.remove(
                              AppCubit.get(context).favoriteShows![index]);
                          AppCubit.get(context)
                              .editFavoriteList('movie', item, false);
                        });
                      },
                      background: Container(color: Colors.red),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: BuildSearchItem(
                          movieImage:
                          'https://image.tmdb.org/t/p/w500${AppCubit.get(context).favoriteShows![index]['poster_path']}',
                          movieName:
                          '${AppCubit.get(context).favoriteShows![index]['title']}',
                          movieRate:
                          '${AppCubit.get(context).favoriteShows![index]['vote_average']}',
                          movieCoverImage:
                          'https://image.tmdb.org/t/p/w500${AppCubit.get(context).favoriteShows![index]['backdrop_path']}',
                          movieOverView:
                          '${AppCubit.get(context).favoriteShows![index]['overview']}',
                          movieReviews:
                          '${AppCubit.get(context).favoriteShows![index]['vote_count']}',
                          movieType: AppCubit.get(context).favoriteShows![index]
                          ['adult'],
                          movieId: AppCubit.get(context).favoriteShows![index]
                          ['id'],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          } else {
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
                    'You Have To Login First!',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 30.0),
                  ),
                ],
              ),
            );
          }
        });
      },
    );
  }
}
