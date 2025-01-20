import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:elm_task/core/network/network.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/network/server_response.dart';

class RemoteDataSource {
  final NetworkInfo networkInfo;
  final Network network;

  RemoteDataSource({required this.networkInfo, required this.network});
  Future<Either<Failure, ServerResponse>> get(
    String endPoint,
    dynamic body,
  ) async =>
      _handleNetworkError(() => network.get(endPoint, body));

  Future<Either<Failure, ServerResponse>> post(
          String endPoint, dynamic body) async =>
      _handleNetworkError(() => network.post(endPoint, body));

  Future<Either<Failure, ServerResponse>> patch(
          String endPoint, dynamic body) async =>
      _handleNetworkError(() => network.put(endPoint, body));

  Future<Either<Failure, ServerResponse>> delete(
          String endPoint, dynamic body) async =>
      _handleNetworkError(() => network.delete(endPoint, body));

  Future<Either<Failure, ServerResponse>> _handleNetworkError(
      Future<Response> Function() request) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await request();
        return Right(ServerResponse(data: res.data));
      } on ServerException catch (e) {
        return Left(ServerFailure(
            message: e.message ?? 'server failure', data: e.data));
      }
    } else {
      return const Left(
          OfflineFailure(message: 'please connect to internet', data: null));
    }
  }
}
