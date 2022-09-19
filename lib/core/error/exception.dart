import 'package:movies/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

class LocalDataSourceExceptio implements Exception {
  final String message;

  const LocalDataSourceExceptio({required this.message});
}
