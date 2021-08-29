import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mega_show/bloc/app_cubit/app_cubit.dart';
import 'package:mega_show/shared/styles/colors.dart';

class BuildMovieItem extends StatelessWidget {
  BuildMovieItem({
    Key? key,
    this.movieName,
    this.movieImage,
    this.movieRate,
  }) : super(key: key);
  final String? movieName;
  final String? movieRate;
  final String? movieImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: <Widget>[
                Image(
                  height: 150.0,
                  width: 100,
                  fit: BoxFit.fill,
                  image: NetworkImage('$movieImage'),
                ),
                Material(
                  color: Colors.transparent,
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Colors.yellow,
                        size: 40.0,
                      ),
                      Text(
                        '$movieRate',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Wrap(
            children: [
              Text(
                '$movieName',
                maxLines: 2,
                overflow: TextOverflow.fade,
                style: TextStyle(fontSize: 15.0, color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BuildFavoriteItem extends StatelessWidget {
  BuildFavoriteItem(
      {Key? key,
      this.movieId,
      this.movieType,
      this.movieRate,
      this.movieImage,
      this.movieCoverImage,
      this.movieName,
      this.movieOverView,
      this.movieReviews})
      : super(key: key);
  final int? movieId;
  final String? movieName;
  final String? movieImage;
  final String? movieCoverImage;
  final String? movieRate;
  final bool? movieType;
  final String? movieOverView;
  final String? movieReviews;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
          image: NetworkImage('$movieImage'),
          height: 130.0,
          width: 100,
          filterQuality: FilterQuality.high,
          fit: BoxFit.fill,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$movieName',
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 23.0),
                ),
                Text(
                  '$movieType',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 18.0),
                ),
                Text(
                  '*$movieRate',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 18.0),
                ),
                Text(
                  'movieReviews',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 23.0),
                ),
                Text(
                  '$movieReviews',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BuildSearchItem extends StatelessWidget {
  BuildSearchItem(
      {Key? key,
      this.movieId,
      this.movieType,
      this.movieRate,
      this.movieImage,
      this.movieCoverImage,
      this.movieName,
      this.movieOverView,
      this.movieReviews})
      : super(key: key);
  final int? movieId;
  final String? movieName;
  final String? movieImage;
  final String? movieCoverImage;
  final String? movieRate;
  final bool? movieType;
  final String? movieOverView;
  final String? movieReviews;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image(
          image: NetworkImage('$movieImage'),
          height: 130.0,
          width: 100,
          filterQuality: FilterQuality.high,
          fit: BoxFit.fill,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$movieName',
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 23.0),
                ),
                Text(
                  '$movieType',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 18.0),
                ),
                Text(
                  '*$movieRate',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 18.0),
                ),
                Text(
                  'movieReviews',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 23.0),
                ),
                Text(
                  '$movieReviews',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Future<bool?> showToast({
  String? massage,
  Color color = Colors.grey,
}) =>
    Fluttertoast.showToast(
      msg: massage!,
      backgroundColor: color,
      fontSize: 17.0,
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 5,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
    );
