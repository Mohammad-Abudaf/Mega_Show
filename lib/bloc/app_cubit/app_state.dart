part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class AppChangeScreenIndexBottomNavBar  extends AppState{}

// get data from api
class AppGetDefaultMovieLoadingState extends AppState{}
class AppGetDefaultMovieSuccessState extends AppState{}
class AppGetDefaultMovieErrorState extends AppState{
  final String error;
  AppGetDefaultMovieErrorState(this.error);
}

// get top rated movies
class AppGetTopRatedMovieLoadingState extends AppState{}
class AppGetTopRatedMovieSuccessState extends AppState{}
class AppGetTopRatedMovieErrorState extends AppState{
  final String error;
  AppGetTopRatedMovieErrorState(this.error);
}

// get new movies
class AppGetNewMovieLoadingState extends AppState{}
class AppGetNewMovieSuccessState extends AppState{}
class AppGetNewMovieErrorState extends AppState{
  final String error;
  AppGetNewMovieErrorState(this.error);
}

// get upcoming movies
class AppGetUpcomingMovieLoadingState extends AppState{}
class AppGetUpcomingMovieSuccessState extends AppState{}
class AppGetUpcomingMovieErrorState extends AppState{
  final String error;
  AppGetUpcomingMovieErrorState(this.error);
}

// get popular movies
class AppGetPopularMovieLoadingState extends AppState{}
class AppGetPopularMovieSuccessState extends AppState{}
class AppGetPopularMovieErrorState extends AppState{
  final String error;
  AppGetPopularMovieErrorState(this.error);
}

// get popular movies
class AppGetSimilarLoadingState extends AppState{}
class AppGetSimilarMovieSuccessState extends AppState{}
class AppGetSimilarMovieErrorState extends AppState{
  final String error;
  AppGetSimilarMovieErrorState(this.error);
}

// get search results
class AppGetSearchResultsLoadingState extends AppState{}
class AppGetSearchResultsSuccessState extends AppState{}
class AppGetSearchResultsErrorState extends AppState{
  final String error; 
  AppGetSearchResultsErrorState(this.error); 
}

// change app theme mode!
class AppChangeThemeMode extends AppState{}

// app request a token
class AppRequestTokenLoadingState extends AppState{}
class AppRequestTokenSuccessState extends AppState{}
class AppRequestTokenErrorState extends AppState{
  final String error;
  AppRequestTokenErrorState(this.error);
}

// sign in states for the user!
class AppSignInLoadingState extends AppState{}
class AppSignInSuccessfulState extends AppState{}
class AppSignInErrorState extends AppState{
  final String error;
  AppSignInErrorState(this.error);
}

// create session id
class AppCreateSessionIdLoadingState extends AppState{}
class AppCreateSessionIdSuccessState extends AppState{}
class AppCreateSessionIdErrorState extends AppState{
  final String error;
  AppCreateSessionIdErrorState(this.error);
}

// get user data 
class AppGetUserDataLoadingState extends AppState{}
class AppGetUserDataSuccessState extends AppState{}
class AppGetUserDataErrorState extends AppState{
  final String error; 
  AppGetUserDataErrorState(this.error); 
}

// get favorite shows for the current user
class AppGetFavoriteShowsLoadingState extends AppState{}
class AppGetFavoriteShowsSuccessState extends AppState{}
class AppGetFavoriteShowsErrorState extends AppState{
  final String error;
  AppGetFavoriteShowsErrorState(this.error);
}

// edit favorite list states 
class AppEditFavoriteListLoadingState extends AppState{}
class AppEditFavoriteListSuccessState extends AppState{}
class AppEditFavoriteListErrorStete extends AppState{
  final String error; 
  AppEditFavoriteListErrorStete(this.error); 
}