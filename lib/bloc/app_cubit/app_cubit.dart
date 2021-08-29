import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_show/models/movies_model.dart';
import 'package:mega_show/models/user_modle.dart';
import 'package:mega_show/roots/home_roots/favorite_screen.dart';
import 'package:mega_show/roots/home_roots/home_screen.dart';
import 'package:mega_show/roots/home_roots/notifications_screen.dart';
import 'package:mega_show/roots/home_roots/tv_screen.dart';
import 'package:mega_show/shared/widgets/constants.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  int screenIndex = 0;
  bool userLoggedIn = false;
  List<Widget> screens = [
    HomeScreen(),
    TVScreen(),
    FavoriteScreen(),
    NotificationScreen(),
  ];
  void changeScreen(int index) {
    if (index == 2){
      getFavoriteShows();
      screenIndex = index;
      emit(AppChangeScreenIndexBottomNavBar());
    } else{
      screenIndex = index;
      emit(AppChangeScreenIndexBottomNavBar());
    }
  }

  bool darkMode = false;
  void changeThemeMode(bool value) {
    darkMode = value;
    emit(AppChangeThemeMode());
  }

  Movie? movie;
  void getData() async {
    Uri url = Uri.parse('https://api.themoviedb.org/3/movie/550?api_key=$API');
    emit(AppGetDefaultMovieLoadingState());
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        movie = Movie.fromJson(jsonDecode(response.body));
        emit(AppGetDefaultMovieSuccessState());
      } else {
        emit(AppGetDefaultMovieErrorState(
            'error in ${response.statusCode.toString()}'));
      }
    } catch (e) {
      emit(AppGetDefaultMovieErrorState(e.toString()));
    }
  }

  List<Map<String, dynamic>>? topRatedMovie = [];
  void getTopRatedMovies() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated?api_key=$API&language=en-US');
    emit(AppGetTopRatedMovieLoadingState());
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        // json path: results
        Map<String, dynamic> data = await jsonDecode(response.body);
        for (var movie in data['results']) {
          topRatedMovie!.add(movie);
        }
      }
      emit(AppGetTopRatedMovieSuccessState());
    } catch (ex) {
      emit(AppGetTopRatedMovieErrorState(ex.toString()));
    }
  }

  List<Map<String, dynamic>>? upComing = [];
  void getUpComing() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$API&language=en-US');
    emit(AppGetUpcomingMovieLoadingState());
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        // json path: results
        Map<String, dynamic> data = await jsonDecode(response.body);
        for (var movie in data['results']) {
          upComing!.add(movie);
        }
      }
      emit(AppGetUpcomingMovieSuccessState());
    } catch (ex) {
      emit(AppGetTopRatedMovieErrorState(ex.toString()));
    }
  }

  List<Map<String, dynamic>>? newMovies = [];
  void getNewMovies() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$API&language=en-US');
    emit(AppGetUpcomingMovieLoadingState());
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        // json path: results
        Map<String, dynamic> data = await jsonDecode(response.body);
        for (var movie in data['results']) {
          newMovies!.add(movie);
        }
      }
      emit(AppGetUpcomingMovieSuccessState());
    } catch (ex) {
      emit(AppGetTopRatedMovieErrorState(ex.toString()));
    }
  }

  List<Map<String, dynamic>>? popularMovies = [];
  void getPopularMovies() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$API&language=en-US');
    emit(AppGetPopularMovieLoadingState());
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        // json path: results
        Map<String, dynamic> data = await jsonDecode(response.body);
        for (var movie in data['results']) {
          popularMovies!.add(movie);
        }
      }
      emit(AppGetPopularMovieSuccessState());
    } catch (ex) {
      emit(AppGetPopularMovieErrorState(ex.toString()));
    }
  }

  Future<List<Map<String, dynamic>>> getSimilarMovie(
    int movieId,
  ) async {
    List<Map<String, dynamic>> similarMovie = [];
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/movie/$movieId/similar?api_key=$API&language=en-US');
    emit(AppGetSimilarLoadingState());
    http.Response response = await http.get(url);
    try {
      if (response.statusCode == 200) {
        // json path: results
        Map<String, dynamic> data = await jsonDecode(response.body);
        for (var movie in data['results']) {
          similarMovie.add(movie);
        }
      }
      emit(AppGetSimilarMovieSuccessState());
      return similarMovie;
    } catch (ex) {
      print(ex.toString());
      emit(AppGetSimilarMovieErrorState(ex.toString()));
      return [];
    }
  }

  String convectQuery(String valueBefore) {
    return valueBefore.replaceAll(' ', '+');
  }

  List<Map<String, dynamic>>? searchResults = [];
  void getSearchResults(String query) async {
    searchResults = [];
    String finalQuery = convectQuery(query);
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=$API&query=$finalQuery');
    emit(AppGetSearchResultsLoadingState());
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = await jsonDecode(response.body);
        for (var result in data['results']) {
          searchResults!.add(result);
        }
      }
      emit(AppGetSearchResultsSuccessState());
    } catch (e) {
      emit(AppGetSearchResultsErrorState(e.toString()));
    }
  }

  void getToken() async {
    Uri url = Uri.parse(
        'https://api.themoviedb.org/3/authentication/token/new?api_key=$API');
    emit(AppRequestTokenLoadingState());
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        token = data['request_token'];
        print('token is $token');
        emit(AppRequestTokenSuccessState());
      } else {
        throw 'error is ${response.statusCode}';
      }
    } catch (ex) {
      print(ex.toString());
      token = '';
      emit(AppRequestTokenErrorState(ex.toString()));
    }
  }

  Future<String> createSession(String? token) async {
    String endPointUrl =
        'https://api.themoviedb.org/3/authentication/session/new?api_key=$API';
    Map<String, dynamic> body = {
      'request_token': token,
    };
    try {
      http.Response response =
          await http.post(Uri.parse(endPointUrl), body: body);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = await jsonDecode(response.body);
        return data['session_id'];
      } else {
        throw 'error in ${response.statusCode}';
      }
    } catch (e) {
      print(e.toString());
      return '';
    }
  }

  void signInWithEmailAndPassword(
      String? username, String? password, String? token) async {
    String endpointUrl =
        'https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=$API';
    Map<String, dynamic> queryPara = {
      'username': username,
      'password': password,
      'request_token': token,
    };
    try {
      http.Response response = await http.post(Uri.parse(endpointUrl), body: queryPara);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = await jsonDecode(response.body);
        print(data);
        userLoggedIn = true;
        token = data['request_token'].toString();
        getUserData();
      } else {
        throw 'error is ${response.statusCode}';
      }
    } catch (e) {
      print(e.toString());
      userLoggedIn = false;
      token = '';
    }
  }
  // moh.sami
  UserModel? userModel;
  void getUserData() async {
    String session = await createSession(token);
    sessionId = session;
    String url =
        'https://api.themoviedb.org/3/account?api_key=$API&session_id=$session';
    emit(AppGetUserDataLoadingState());
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        userModel = UserModel.fromJson(data);
        getFavoriteShows();
        emit(AppGetUserDataSuccessState());
      } else {
        throw 'error response ${response.statusCode}';
      }
    } catch (e) {
      print(e.toString());
      emit(AppGetUserDataErrorState(e.toString()));
    }
  }

  List<Map<String, dynamic>>? favoriteShows = [];
  List<String> favoriteShowsNames = [];
  void getFavoriteShows() async {
    String url = 'https://api.themoviedb.org/3/account/${userModel!.id}/favorite/movies?api_key=$API&session_id=$sessionId';
  emit(AppGetFavoriteShowsLoadingState());
    try {
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200 || response.statusCode == 201) {
        favoriteShows!.clear();
        favoriteShowsNames.clear();
        var data = jsonDecode(response.body);
        for (var show in data['results']) {
          favoriteShows!.add(show);
        }
        for (var show in favoriteShows!){
          favoriteShowsNames.add(show['title']);
        }
        print('shows names is $favoriteShowsNames');
        emit(AppGetFavoriteShowsSuccessState());
      } else {
        throw 'error in ${response.statusCode}'; 
      }
    } catch (exception) {
      print(exception.toString());
      emit(AppGetFavoriteShowsErrorState(exception.toString()));
    }
  }

  void editFavoriteList(String mediaType, int mediaId, bool inFavorite) async{
    String uri = 'https://api.themoviedb.org/3/account/${userModel!.id}/favorite?api_key=$API&session_id=$sessionId';
    Map <String, String> header = {
      'Content-Type': 'application/json;charset=utf-8',
    }; 
    Map <String, dynamic> body = {
      'media_type': mediaType, 
      'media_id': mediaId, 
      'favorite': inFavorite, 
    }; 
    emit(AppEditFavoriteListLoadingState()); 
    try {
      http.Response response = await http.post(Uri.parse(uri), headers: header, body: jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode == 201){
        getFavoriteShows();
        emit (AppEditFavoriteListSuccessState());
      } else {
        throw 'there is error in edit Favorite List ${response.statusCode}';
      }
    }catch (exception){
      print(exception.toString());
      emit(AppEditFavoriteListErrorStete(exception.toString())); 
    }
  }
}
