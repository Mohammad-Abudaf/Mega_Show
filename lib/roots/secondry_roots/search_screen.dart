import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_show/bloc/app_cubit/app_cubit.dart';
import 'package:mega_show/shared/styles/colors.dart';
import 'package:mega_show/shared/widgets/widgets.dart';

import 'movie_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? keyword;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Builder(
          builder: (BuildContext context) {
            if (MediaQuery.of(context).size.width.toInt() <= 400|| MediaQuery.of(context).size.width.toInt() <= 843){
              return MediaQuery(data: MediaQuery.of(context).copyWith(
                textScaleFactor: 0.8,
              ), child: Scaffold(
                appBar: AppBar(),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new TextFormField(
                          textDirection: TextDirection.ltr,
                          onChanged: (String value) {
                            setState(() {
                              AppCubit.get(context).searchResults = [];
                              keyword = value;
                              AppCubit.get(context).getSearchResults(value);
                            });
                            print(AppCubit.get(context).searchResults);
                          },
                          style: TextStyle(
                            fontSize: 18.0,
                            color: AppCubit.get(context).darkMode? Colors.white: Colors.black,
                          ),
                          decoration: new InputDecoration(
                            enabledBorder: new OutlineInputBorder(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                                borderSide: BorderSide(
                                  color: Theme.of(context).scaffoldBackgroundColor !=
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
                            hintText: 'Tell us what are you looking for',
                            hintStyle: TextStyle(
                              color: AppCubit.get(context).darkMode? Colors.white: Colors.black,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.tealAccent,
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        if (AppCubit.get(context).searchResults != null || AppCubit.get(context).searchResults!.length != 0)
                          if (state is AppGetSearchResultsLoadingState)
                            CircularProgressIndicator(),
                        ListView.separated(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              AppCubit.get(context).getSimilarMovie(AppCubit.get(context).searchResults![index]['id']
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BuildMoviePage(
                                    movieImage:
                                    'https://image.tmdb.org/t/p/w500${AppCubit.get(context).searchResults![index]['poster_path']}',
                                    movieName: '${AppCubit.get(context).searchResults![index]['title']}',
                                    movieRate: '${AppCubit.get(context).searchResults![index]['vote_average']}',
                                    movieCover: 'https://image.tmdb.org/t/p/w500${AppCubit.get(context).searchResults![index]['backdrop_path']}',
                                    movieDescription: '${AppCubit.get(context).searchResults![index]['overview']}',
                                    movieReviews: '${AppCubit.get(context).searchResults![index]['vote_count']}',
                                    movieType: AppCubit.get(context).searchResults![index]['adult'],
                                    movieId: AppCubit.get(context).searchResults![index]['id'],
                                    movie: AppCubit.get(context).searchResults![index],
                                    favoriteMoviesNames: AppCubit.get(context).favoriteShowsNames,
                                  ),
                                ),
                              );
                            },
                            child: BuildSearchItem(
                              movieImage:
                              'https://image.tmdb.org/t/p/w500${AppCubit.get(context).searchResults![index]['poster_path']}',
                              movieName: '${AppCubit.get(context).searchResults![index]['title']}',
                              movieRate: '${AppCubit.get(context).searchResults![index]['vote_average']}',
                              movieCoverImage: 'https://image.tmdb.org/t/p/w500${AppCubit.get(context).searchResults![index]['backdrop_path']}',
                              movieOverView: '${AppCubit.get(context).searchResults![index]['overview']}',
                              movieReviews: '${AppCubit.get(context).searchResults![index]['vote_count']}',
                              movieType: AppCubit.get(context).searchResults![index]['adult'],
                              movieId: AppCubit.get(context).searchResults![index]['id'],
                            ),
                          ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: AppCubit.get(context).searchResults!.length,),
                      ],
                    ),
                  ),
                ),
              ));
            }
            return Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      new TextFormField(
                        textDirection: TextDirection.ltr,
                        onChanged: (String value) {
                          setState(() {
                            AppCubit.get(context).searchResults = [];
                            keyword = value;
                            AppCubit.get(context).getSearchResults(value);
                          });
                          print(AppCubit.get(context).searchResults);
                        },
                        style: TextStyle(
                          fontSize: 18.0,
                          color: AppCubit.get(context).darkMode? Colors.white: Colors.black,
                        ),
                        decoration: new InputDecoration(
                          enabledBorder: new OutlineInputBorder(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                color: Theme.of(context).scaffoldBackgroundColor !=
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
                          hintText: 'Tell us what are you looking for',
                          hintStyle: TextStyle(
                            color: AppCubit.get(context).darkMode? Colors.white: Colors.black,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.tealAccent,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      if (AppCubit.get(context).searchResults != null || AppCubit.get(context).searchResults!.length != 0)
                        if (state is AppGetSearchResultsLoadingState)
                          CircularProgressIndicator(),
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            AppCubit.get(context).getSimilarMovie(AppCubit.get(context).searchResults![index]['id']
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BuildMoviePage(
                                  movieImage:
                                  'https://image.tmdb.org/t/p/w500${AppCubit.get(context).searchResults![index]['poster_path']}',
                                  movieName: '${AppCubit.get(context).searchResults![index]['title']}',
                                  movieRate: '${AppCubit.get(context).searchResults![index]['vote_average']}',
                                  movieCover: 'https://image.tmdb.org/t/p/w500${AppCubit.get(context).searchResults![index]['backdrop_path']}',
                                  movieDescription: '${AppCubit.get(context).searchResults![index]['overview']}',
                                  movieReviews: '${AppCubit.get(context).searchResults![index]['vote_count']}',
                                  movieType: AppCubit.get(context).searchResults![index]['adult'],
                                  movieId: AppCubit.get(context).searchResults![index]['id'],
                                  movie: AppCubit.get(context).searchResults![index],
                                  favoriteMoviesNames: AppCubit.get(context).favoriteShowsNames,
                                ),
                              ),
                            );
                          },
                          child: BuildSearchItem(
                            movieImage:
                            'https://image.tmdb.org/t/p/w500${AppCubit.get(context).searchResults![index]['poster_path']}',
                            movieName: '${AppCubit.get(context).searchResults![index]['title']}',
                            movieRate: '${AppCubit.get(context).searchResults![index]['vote_average']}',
                            movieCoverImage: 'https://image.tmdb.org/t/p/w500${AppCubit.get(context).searchResults![index]['backdrop_path']}',
                            movieOverView: '${AppCubit.get(context).searchResults![index]['overview']}',
                            movieReviews: '${AppCubit.get(context).searchResults![index]['vote_count']}',
                            movieType: AppCubit.get(context).searchResults![index]['adult'],
                            movieId: AppCubit.get(context).searchResults![index]['id'],
                          ),
                        ),
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: AppCubit.get(context).searchResults!.length,),
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
