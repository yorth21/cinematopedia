import 'package:dio/dio.dart';

import 'package:cinematopedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinematopedia/infrastructure/models/moviedb/moviedb_response.dart';

import 'package:cinematopedia/config/constants/environment.dart';
import 'package:cinematopedia/domain/datasources/movies_datasource.dart';
import 'package:cinematopedia/domain/entities/movie.dart';

class MovieDbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map(
          (moviedb) => MovieMapper.movieDBToEntity(moviedb),
        )
        .toList();

    return movies;
  }
}
