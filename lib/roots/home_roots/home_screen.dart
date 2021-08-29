import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_show/bloc/app_cubit/app_cubit.dart';
import 'package:mega_show/roots/secondry_roots/movie_screen.dart';
import 'package:mega_show/shared/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  CarouselController carouselController = new CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: CarouselSlider(
                  carouselController: carouselController,
                  options: CarouselOptions(
                    height: 180.0,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                    initialPage: 0,
                    autoPlayAnimationDuration: Duration(seconds: 3),
                    viewportFraction: 0.8,
                    pageSnapping: true,
                    reverse: false,
                  ),
                  items: AppCubit.get(context).popularMovies!.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Stack(
                            children: [
                              Image(
                                height: double.infinity,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500/${i['backdrop_path']}'),
                              ),
                              Container(
                                alignment: AlignmentDirectional.bottomEnd,
                                padding: const EdgeInsetsDirectional.all(10.0),
                                child: Text(
                                  '${i['original_title']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white70,
                                      fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.all(20.0),
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'New Movies',
                  style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 25,),
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
                      AppCubit.get(context).getSimilarMovie(AppCubit.get(context).newMovies![index]['id']
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuildMoviePage(
                            movieImage: 'https://image.tmdb.org/t/p/w500${AppCubit.get(context).newMovies![index]['poster_path']}',
                            movieName: '${AppCubit.get(context).newMovies![index]['title']}',
                            movieRate: '${AppCubit.get(context).newMovies![index]['vote_average']}',
                            movieCover: 'https://image.tmdb.org/t/p/w500${AppCubit.get(context).newMovies![index]['backdrop_path']}',
                            movieDescription: '${AppCubit.get(context).newMovies![index]['overview']}',
                            movieReviews: '${AppCubit.get(context).newMovies![index]['vote_count']}',
                            movieType: AppCubit.get(context).newMovies![index]['adult'],
                            movieId: AppCubit.get(context).newMovies![index]['id'],
                            movie: AppCubit.get(context).newMovies![index],
                            favoriteMoviesNames: AppCubit.get(context).favoriteShowsNames,
                          ),
                        ),
                      );
                    },
                        child: BuildMovieItem(
                      movieRate: '${AppCubit.get(context).newMovies![index]['vote_average']}',
                      movieName: '${AppCubit.get(context).newMovies![index]['original_title']}',
                      movieImage:
                          'https://image.tmdb.org/t/p/w500${AppCubit.get(context).newMovies![index]['poster_path']}',
                    ),
                  ),
                  itemCount: AppCubit.get(context).newMovies!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 20.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.all(20.0),
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Top Rated',
                  style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 25,),
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
                          AppCubit.get(context).getSimilarMovie(AppCubit.get(context).topRatedMovie![index]['id']);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuildMoviePage(
                                movieImage:
                                'https://image.tmdb.org/t/p/w500${AppCubit.get(context).topRatedMovie![index]['poster_path']}',
                                movieName: '${AppCubit.get(context).topRatedMovie![index]['title']}',
                                movieRate: '${AppCubit.get(context).topRatedMovie![index]['vote_average']}',
                                movieCover: 'https://image.tmdb.org/t/p/w500${AppCubit.get(context).topRatedMovie![index]['backdrop_path']}',
                                movieDescription: '${AppCubit.get(context).topRatedMovie![index]['overview']}',
                                movieReviews: '${AppCubit.get(context).topRatedMovie![index]['vote_count']}',
                                movieType: AppCubit.get(context).topRatedMovie![index]['adult'],
                                movieId: AppCubit.get(context).topRatedMovie![index]['id'],
                                movie: AppCubit.get(context).topRatedMovie![index],
                                favoriteMoviesNames: AppCubit.get(context).favoriteShowsNames,

                              ),
                            ),
                          );
                        },
                        child: BuildMovieItem(
                    movieRate: '${AppCubit.get(context).topRatedMovie![index]['vote_average']}',
                    movieName:
                          '${AppCubit.get(context).topRatedMovie![index]['original_title']}',
                    movieImage:
                          'https://image.tmdb.org/t/p/w500${AppCubit.get(context).topRatedMovie![index]['poster_path']}',
                  ),
                      ),
                  itemCount: AppCubit.get(context).topRatedMovie!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 20.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.all(20.0),
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  'Coming Soon',
                  style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 25,),
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
                          AppCubit.get(context).getSimilarMovie(AppCubit.get(context).upComing![index]['id']);
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BuildMoviePage(
                                movieImage:
                                'https://image.tmdb.org/t/p/w500${AppCubit.get(context).upComing![index]['poster_path']}',
                                movieName: '${AppCubit.get(context).upComing![index]['title']}',
                                movieRate: '${AppCubit.get(context).upComing![index]['vote_average']}',
                                movieCover: 'https://image.tmdb.org/t/p/w500${AppCubit.get(context).upComing![index]['backdrop_path']}',
                                movieDescription: '${AppCubit.get(context).upComing![index]['overview']}',
                                movieReviews: '${AppCubit.get(context).upComing![index]['vote_count']}',
                                movieType: AppCubit.get(context).upComing![index]['adult'],
                                movieId: AppCubit.get(context).upComing![index]['id'],
                                movie: AppCubit.get(context).upComing![index],
                                favoriteMoviesNames: AppCubit.get(context).favoriteShowsNames,
                              ),
                            ),
                          );
                        },
                        child: BuildMovieItem(
                    movieRate: '${AppCubit.get(context).upComing![index]['vote_average']}',
                    movieName: '${AppCubit.get(context).upComing![index]['original_title']}',
                    movieImage:
                          'https://image.tmdb.org/t/p/w500${AppCubit.get(context).upComing![index]['poster_path']}',
                  ),
                      ),
                  itemCount: AppCubit.get(context).upComing!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    width: 20.0,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
