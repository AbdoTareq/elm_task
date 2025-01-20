import 'package:elm_task/core/error/exceptions.dart';
import 'package:elm_task/core/network/network_info.dart';
import 'package:elm_task/export.dart';
import 'package:elm_task/features/auth/domain/entities/verify.dart';

import '../../domain/repositories/auth_repo.dart';

class AuthRepoImp implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepoImp({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> login(String email) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.login(email);
        return Right(res);
      } on ServerException {
        return Left(ServerFailure(message: 'server failure', data: null));
      }
    } else {
      return const Left(
          OfflineFailure(message: 'please connect to internet', data: null));
    }
  }

  @override
  Future<Either<Failure, Verify>> verifyOtp(String email, String otp) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.verifyOtp(email, otp);
        return Right(res);
      } on ServerException {
        return Left(ServerFailure(message: 'server failure', data: null));
      }
    } else {
      return const Left(
          OfflineFailure(message: 'please connect to internet', data: null));
    }
  }
}
