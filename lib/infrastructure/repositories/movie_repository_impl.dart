import 'package:cinematopedia/domain/datasources/movies_datasource.dart';
import 'package:cinematopedia/domain/entities/movie.dart';
import 'package:cinematopedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
