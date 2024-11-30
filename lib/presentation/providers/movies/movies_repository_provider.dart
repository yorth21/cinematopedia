import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinematopedia/infrastructure/datasource/moviedb_datasource.dart';
import 'package:cinematopedia/infrastructure/repositories/movie_repository_impl.dart';

// Este repositorio es inmutable
final movieRepositoryProvider = Provider(
  (ref) {
    return MovieRepositoryImpl(MovieDbDatasource());
  },
);
