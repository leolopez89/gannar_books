import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gannar_books/utils/exceptions/user_not_found_exception.dart';
import 'package:gannar_books/utils/resources/error_state.dart';

typedef ActionCallback<T> = Future<T> Function();

abstract class ProcessException {
  /// Método responsable del manejo de la petición [request], en el que se
  /// devuelve de forma general un [ErrorState] o los datos [T] genéricos
  /// obtenidos de la red.
  ///
  /// Devuelve los datos genéricos [T] si se recibe una respuesta satisfactoria
  ///
  /// Devuelve [ErrorState] que contiene el mensaje de la excepción si ocurre un
  /// un error al enviar o recibir la respuesta.
  @protected
  Future<Either<ErrorState, T>> process<T>(
      {required ActionCallback<T> request}) async {
    try {
      final result = await request();
      return Right(result);
    } on DioException catch (error) {
      return Left(NetworkError(error.message ?? "Unknown error"));
    } on UserNotFoundException catch (_) {
      return const Left(UserNotFound());
    }
  }
}
