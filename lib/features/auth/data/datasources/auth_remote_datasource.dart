import 'package:dio/dio.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../models/login_request_model.dart';
import '../models/login_response_model.dart';

abstract class AuthRemoteDatasource {
  Future<LoginResponseModel> login(LoginRequestModel data);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient dioClient;

  AuthRemoteDatasourceImpl(this.dioClient);

  @override
  Future<LoginResponseModel> login(LoginRequestModel data) async {
    final response = await dioClient.dio.post(
      ApiEndpoints.login,
      data: data.toJson(),
    );

    return LoginResponseModel.fromJson(response.data);
  }
}
