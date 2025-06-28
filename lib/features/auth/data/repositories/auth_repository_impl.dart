import 'package:dartz/dartz.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../models/login_request_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<Either<String, UserEntity>> login(
    String email,
    String password,
  ) async {
    try {
      final response = await remote.login(
        LoginRequestModel(email: email, password: password),
      );

      return Right(UserEntity(user: response.data!, jwt: response.jwt!));
    } catch (e) {
      return Left('Login fallido: ${e.toString()}');
    }
  }
}
