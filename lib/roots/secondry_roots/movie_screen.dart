import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_show/bloc/app_cubit/app_cubit.dart';
import 'package:mega_show/layouts/home_layout.dart';
import 'package:mega_show/shared/styles/colors.dart';
import 'package:mega_show/shared/widgets/constants.dart';
import 'package:mega_show/shared/widgets/widgets.dart';
import 'package:http/http.dart' as http;

class BuildMoviePage extends StatefulWidget {
  BuildMoviePage(
      {Key? key,
      this.movieRate,
      this.movieImage,
      this.movieName,
      this.movieCover,
      this.movieType,
      this.movieDescription,
      this.movieReviews,
      this.movieId,
      this.movie,
      this.favoriteMoviesNames})
      : super(key: key);
  final String? movieName;
  final String? movieRate;
  final String? movieDescription;
  final String? movieImage;
  final String? movieCover;
  final String? movieReviews;
  final bool? movieType;
  final int? movieId;
  final Map<String, dynamic>? movie;
  final List<String>? favoriteMoviesNames;

  @override
  _BuildMoviePageState createState() => _BuildMoviePageState();
}

class _BuildMoviePageState extends State<BuildMoviePage> {
  List<Map<String, dynamic>> similarMovie = [];
  void fillSimilarMovieList() async {
    similarMovie = await _getSimilarMovie(widget.movieId!);
  }

  Future<List<Map<String, dynamic>>> _getSimilarMovie(
    int? movieId,
  ) async {
    List<Map<String, dynamic>> similarMovie = [];
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId/similar?api_key=$API&language=en-US');
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        // json path: results
        similarMovie.clear();
        Map<String, dynamic> data = await jsonDecode(response.body);
        for (var movie in data['results']) {
          similarMovie.add(movie);
          setState(() {});
        }
      }
      return similarMovie;
    } catch (ex) {
      print(ex.toString());
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    fillSimilarMovieList();
  }

  @override
  void deactivate() {
    super.deactivate();
  }
  @override
  void dipose(){
    super.dispose(); 
    similarMovie.clear();
  }

  bool? isInFavorite;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        isInFavorite = widget.favoriteMoviesNames!.contains(widget.movieName);
        return Builder(
          builder: (BuildContext context) {
            print(MediaQuery.of(context).size.width.toInt());
            print(MediaQuery.of(context).size.height.toInt());
            if (MediaQuery.of(context).size.width.toInt() <= 400|| MediaQuery.of(context).size.width.toInt() <= 843){
                return MediaQuery(data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 0.8
                ), child: Scaffold(
                  body: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 300,
                          child: Stack(
                            children: [
                              Container(
                                height: 180.0,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage('${widget.movieCover}'),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    top: 20.0, start: 20.0),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    )),
                              ),
                              Padding(
                                padding:
                                const EdgeInsetsDirectional.only(start: 20.0),
                                child: Align(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Image(
                                        height: 180,
                                        width: 130,
                                        fit: BoxFit.fill,
                                        image: NetworkImage('${widget.movieImage}'),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '${widget.movieName}',
                                                      softWrap: true,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(fontSize: 23),
                                                    ),
                                                    Text(
                                                      '${widget.movieType! ? 'for all ages' : '+18'}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(fontSize: 20),
                                                    ),
                                                    Text(
                                                      '${widget.movieRate}/10',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(fontSize: 25),
                                                    ),
                                                    Text(
                                                      'Reviews',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(fontSize: 25),
                                                    ),
                                                    Text(
                                                      '${widget.movieReviews}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(fontSize: 14.0),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            if (!AppCubit.get(context).userLoggedIn)
                                              IconButton(
                                                onPressed: () {
                                                  showToast(
                                                      massage:
                                                      'you have to login first',
                                                      color: Colors.red);
                                                },
                                                icon: Icon(
                                                  Icons.favorite_border,
                                                  color: MAIN_COLOR,
                                                  size: 30.0,
                                                ),
                                              ),
                                            if (AppCubit.get(context)
                                                .userLoggedIn &&
                                                isInFavorite!)
                                              IconButton(
                                                onPressed: () {
                                                  AppCubit.get(context)
                                                      .editFavoriteList(
                                                      'movie',
                                                      widget.movieId!.toInt(),
                                                      false);
                                                  AppCubit.get(context)
                                                      .getFavoriteShows();
                                                  setState(() {});
                                                },
                                                icon: Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                  size: 30.0,
                                                ),
                                              ),
                                            if (AppCubit.get(context)
                                                .userLoggedIn &&
                                                !isInFavorite!)
                                              IconButton(
                                                onPressed: () {
                                                  AppCubit.get(context)
                                                      .editFavoriteList(
                                                      'movie',
                                                      widget.movieId!.toInt(),
                                                      true);
                                                  AppCubit.get(context)
                                                      .getFavoriteShows();
                                                  setState(() {});
                                                },
                                                icon: Icon(
                                                  Icons.favorite_outline,
                                                  color: MAIN_COLOR,
                                                  size: 30.0,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsetsDirectional.only(
                              start: 20.0, top: 20.0, end: 20.0, bottom: 20.0),
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            'Overview',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 30),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            "${widget.movieDescription}",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 15),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsetsDirectional.only(
                              start: 20.0, top: 20.0, end: 20.0, bottom: 20.0),
                          alignment: AlignmentDirectional.topStart,
                          child: Text(
                            'Similar',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 30),
                          ),
                        ),
                        Container(
                          height: 200.0,
                          width: double.infinity,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) =>
                                GestureDetector(
                                  onTap: () {
                                    fillSimilarMovieList();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => BuildMoviePage(
                                          movieImage:
                                          'https://image.tmdb.org/t/p/w500${similarMovie[index]['poster_path']}',
                                          movieName: '${similarMovie[index]['title']}',
                                          movieRate:
                                          '${similarMovie[index]['vote_average']}',
                                          movieCover:
                                          'https://image.tmdb.org/t/p/w500${similarMovie[index]['backdrop_path']}',
                                          movieDescription:
                                          '${similarMovie[index]['overview']}',
                                          movieReviews:
                                          '${similarMovie[index]['vote_count']}',
                                          movieType: similarMovie[index]['adult'],
                                          movieId: similarMovie[index]['id'],
                                          favoriteMoviesNames:
                                          AppCubit.get(context).favoriteShowsNames,
                                          movie: similarMovie[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: BuildMovieItem(
                                    movieRate: '${similarMovie[index]['vote_average']}',
                                    movieName:
                                    '${similarMovie[index]['original_title']}',
                                    movieImage:
                                    'https://image.tmdb.org/t/p/w500${similarMovie[index]['poster_path']}',
                                  ),
                                ),
                            itemCount: similarMovie.length,
                            separatorBuilder: (BuildContext context, int index) =>
                                SizedBox(
                                  width: 20.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ));
              }
              return Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 320,
                        child: Stack(
                          children: [
                            Container(
                              height: 200.0,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage('${widget.movieCover}'),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  top: 20.0, start: 20.0),
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )),
                            ),
                            Padding(
                              padding:
                              const EdgeInsetsDirectional.only(start: 20.0),
                              child: Align(
                                alignment: AlignmentDirectional.bottomCenter,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Image(
                                      height: 200,
                                      width: 150,
                                      fit: BoxFit.fill,
                                      image: NetworkImage('${widget.movieImage}'),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${widget.movieName}',
                                                    softWrap: true,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6!
                                                        .copyWith(fontSize: 23),
                                                  ),
                                                  Text(
                                                    '${widget.movieType! ? 'for all ages' : '+18'}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6!
                                                        .copyWith(fontSize: 20),
                                                  ),
                                                  Text(
                                                    '${widget.movieRate}/10',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6!
                                                        .copyWith(fontSize: 25),
                                                  ),
                                                  Text(
                                                    'Reviews',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6!
                                                        .copyWith(fontSize: 25),
                                                  ),
                                                  Text(
                                                    '${widget.movieReviews}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6!
                                                        .copyWith(fontSize: 14.0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          if (!AppCubit.get(context).userLoggedIn)
                                            IconButton(
                                              onPressed: () {
                                                showToast(
                                                    massage:
                                                    'you have to login first',
                                                    color: Colors.red);
                                              },
                                              icon: Icon(
                                                Icons.favorite_border,
                                                color: MAIN_COLOR,
                                                size: 30.0,
                                              ),
                                            ),
                                          if (AppCubit.get(context)
                                              .userLoggedIn &&
                                              isInFavorite!)
                                            IconButton(
                                              onPressed: () {
                                                AppCubit.get(context)
                                                    .editFavoriteList(
                                                    'movie',
                                                    widget.movieId!.toInt(),
                                                    false);
                                                AppCubit.get(context)
                                                    .getFavoriteShows();
                                                setState(() {});
                                              },
                                              icon: Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                                size: 30.0,
                                              ),
                                            ),
                                          if (AppCubit.get(context)
                                              .userLoggedIn &&
                                              !isInFavorite!)
                                            IconButton(
                                              onPressed: () {
                                                AppCubit.get(context)
                                                    .editFavoriteList(
                                                    'movie',
                                                    widget.movieId!.toInt(),
                                                    true);
                                                AppCubit.get(context)
                                                    .getFavoriteShows();
                                                setState(() {});
                                              },
                                              icon: Icon(
                                                Icons.favorite_outline,
                                                color: MAIN_COLOR,
                                                size: 30.0,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsetsDirectional.only(
                            start: 20.0, top: 20.0, end: 20.0, bottom: 20.0),
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          'Overview',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 30),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          "${widget.movieDescription}",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 15),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsetsDirectional.only(
                            start: 20.0, top: 20.0, end: 20.0, bottom: 20.0),
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          'Similar',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 30),
                        ),
                      ),
                      Container(
                        height: 200.0,
                        width: double.infinity,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) =>
                              GestureDetector(
                                onTap: () {
                                  fillSimilarMovieList();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BuildMoviePage(
                                        movieImage:
                                        'https://image.tmdb.org/t/p/w500${similarMovie[index]['poster_path']}',
                                        movieName: '${similarMovie[index]['title']}',
                                        movieRate:
                                        '${similarMovie[index]['vote_average']}',
                                        movieCover:
                                        'https://image.tmdb.org/t/p/w500${similarMovie[index]['backdrop_path']}',
                                        movieDescription:
                                        '${similarMovie[index]['overview']}',
                                        movieReviews:
                                        '${similarMovie[index]['vote_count']}',
                                        movieType: similarMovie[index]['adult'],
                                        movieId: similarMovie[index]['id'],
                                        favoriteMoviesNames:
                                        AppCubit.get(context).favoriteShowsNames,
                                        movie: similarMovie[index],
                                      ),
                                    ),
                                  );
                                },
                                child: BuildMovieItem(
                                  movieRate: '${similarMovie[index]['vote_average']}',
                                  movieName:
                                  '${similarMovie[index]['original_title']}',
                                  movieImage:
                                  'https://image.tmdb.org/t/p/w500${similarMovie[index]['poster_path']}',
                                ),
                              ),
                          itemCount: similarMovie.length,
                          separatorBuilder: (BuildContext context, int index) =>
                              SizedBox(
                                width: 20.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
          },
        );
      },
    );
  }
}
