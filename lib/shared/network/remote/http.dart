import 'package:http/http.dart';

class HttpHelper {
  Uri url = Uri.parse('https://api.themoviedb.org/3/movie/550?api_key=b2e80cefafefdba72c17044438f89726');
  Response? response;
  void getData() async  {
    response = await get(url);
  }
}