import 'package:dio/dio.dart';
import 'package:waste_exchange/data/api/api_user_repository.dart';
import 'package:waste_exchange/data/repositories/auth_repository.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/entities/user.dart';
import 'package:waste_exchange/presentation/misc/api_client.dart';
import 'package:waste_exchange/presentation/misc/constants.dart';
import 'package:waste_exchange/presentation/misc/token_helper.dart';
import 'package:waste_exchange/presentation/misc/utils.dart';

class ApiAuthRepository implements AuthRepository {
  late final ApiClient _apiClient;

  ApiAuthRepository({ApiClient? apiClient}) : _apiClient = apiClient ?? ApiClient(baseUrl: "${Constants.BASEURL}/api");

  @override
  Future<bool> getLoggedInUser() async {
    try {
      final userResult = await ApiUserRepository().getUser();

      if (userResult.isSuccess) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (_) {
      return false;
    }
  }

  @override
  Future<Result<User>> login({required String email, required String password}) async {
    try {
      final response = await _apiClient.post(
        "/login",
        data: {'email': email, 'password': password},
      );
      final result = User.fromJson(response.data['data']['user']);
      await TokenHelper().setToken(response.data['data']['token']);

      return Result.success(result);
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message']);
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      final token = await TokenHelper().getToken();
      final response = await _apiClient.post("/logout", authorization: true, token: token);
      await TokenHelper().setToken(null);
      printIfDebug(response.data['message']);
      return const Result.success(null);
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message']);
    }
  }

  @override
  Future<Result<User>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String password_confirmation,
  }) async {
    try {
      final response = await _apiClient.post(
        "/register",
        data: {
          'name': name,
          'phone_number': phone,
          'email': email,
          'password': password,
          'password_confirmation': password_confirmation,
        },
      );
      final result = User.fromJson(response.data['data']['user']);
      await TokenHelper().setToken(response.data['data']['token']);
      return Result.success(result);
    } on DioException catch (e) {
      return Result.failed(e.response?.data['message']);
    }
  }
}
