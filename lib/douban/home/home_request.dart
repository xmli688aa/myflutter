import 'package:my_app/service/config.dart';
import 'package:my_app/service/http_request.dart';

import '../model/home_model.dart';
class HomeRequest{
  static Future<List<MovieItem>> requestMovieList(int start) async{
    const apikey = "0b2bdeda43b5688921839c8ecb20399b";
    // 1.构建URL
    final movieURL = "/movie/top250?start=$start&count=${HomeConfig.movieCount}&apikey=$apikey";

    // 2.发送网络请求获取结果
    final result = await HttpRequest.request(url: movieURL, params: {});
    final subjects = result["subjects"];

    // 3.将Map转成Model
    List<MovieItem> movies = [];
    for (var sub in subjects) {
      movies.add(MovieItem.fromMap(sub));
    }

    return movies;
}
}