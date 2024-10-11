import 'package:dio/dio.dart';
import 'package:waste_exchange/data/repositories/user_repository.dart';
import 'package:waste_exchange/domain/entities/balance.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/entities/user.dart';
import 'package:waste_exchange/presentation/misc/api_client.dart';
import 'package:waste_exchange/presentation/misc/constants.dart';
import 'package:waste_exchange/presentation/misc/token_helper.dart';

class ApiUserRepository implements UserRepository {
  late final ApiClient _apiClient;

  ApiUserRepository({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient(baseUrl: "${Constants.BASEURL}/api");

  @override
  Future<Result<Balance>> getBalance() async {
    try {
      final token = await TokenHelper().getToken();
      final response = await _apiClient.get("/user/balance", authorization: true, token: token);
      final result = Balance.fromJson(response.data);

      return Result.success(result);
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message']);
    }
  }

  @override
  Future<Result<User>> getUser() async {
    try {
      final token = await TokenHelper().getToken();
      final response = await _apiClient.get("/user/profile", authorization: true, token: token);
      final result = User.fromJson(response.data['data']);

      return Result.success(result);
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message']);
    }
  }

  @override
  Future<Result<String>> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final token = await TokenHelper().getToken();
      final response = await _apiClient.post(
        "/user/change-password",
        authorization: true,
        token: token,
        data: {
          'current_password': currentPassword,
          'new_password': newPassword,
          'new_password_confirmation': newPassword,
        },
      );
      final result = response.data['message'];

      return Result.success(result);
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message']);
    }
  }

  @override
  Future<Result<User>> updateProfile({
    required String name,
    required String phoneNumber,
    required String email,
  }) async {
    try {
      final token = await TokenHelper().getToken();
      final response = await _apiClient.put(
        "/user/profile",
        authorization: true,
        token: token,
        data: {
          'name': name,
          'phone_number': phoneNumber,
          'email': email,
        },
      );
      final result = User.fromJson(response.data['data']);

      return Result.success(result);
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message']);
    }
  }
}
