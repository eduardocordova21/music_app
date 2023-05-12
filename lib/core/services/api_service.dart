import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:music_app/shared/models/genre_details_model.dart';

import '../../shared/models/genre_model.dart';
import '../errors/exceptions.dart';

class ApiService extends DioForNative {
  ApiService([super.baseOptions]);

  Future<List<GenreModel>> getGenres() async {
    try {
      const endpoint = "/genres";
      final response = await get(endpoint);
      return (response.data as List)
          .map((genre) => GenreModel.fromMap(genre))
          .toList();
    } on DioError catch (dioError, stackTrace) {
      log(
        "Erro ao fazer o GET dos genêros musicais",
        error: dioError,
        stackTrace: stackTrace,
      );
      throw ApiException(
          message: "Erro ao carregar genêros",
          statusCode: dioError.response?.statusCode);
    } catch (error, stackTrace) {
      log("Erro ao fazer o GET dos genêros musicais",
          error: error, stackTrace: stackTrace);
      throw GeneralException();
    }
  }

  Future<GenreDetailsModel> getGenreDetails({required String genre}) async {
    try {
      final endpoint = "/genres/$genre";
      final response = await get(endpoint);
      return GenreDetailsModel.fromMap(response.data);
    } on DioError catch (dioError, stackTrace) {
      log(
        "Erro ao fazer o GET dos detalhes do genêro musicail",
        error: dioError,
        stackTrace: stackTrace,
      );
      throw ApiException(
          message: "Erro ao carregar detalhes do genêro musical",
          statusCode: dioError.response?.statusCode);
    } catch (error, stackTrace) {
      log("Erro ao fazer o GET dos detalhes do genêro musicail",
          error: error, stackTrace: stackTrace);
      throw GeneralException();
    }
  }
}
