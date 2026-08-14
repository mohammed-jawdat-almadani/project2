import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, User>> login({required String phone, required String password}) async {
    try {
      final userModel = await _remoteDataSource.login(phone: phone, password: password);
      return Right(userModel.toEntity());
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Left(ServerFailure('Invalid phone number or password.'));
      }
      return Left(ServerFailure(e.message ?? 'Unknown error occurred.'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> sendRegisterOtp({required String phone}) async {
    try {
      final debugCode = await _remoteDataSource.sendRegisterOtp(phone: phone);
      return Right(debugCode);
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? 'Unknown error occurred.'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({required String phone}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }
}
