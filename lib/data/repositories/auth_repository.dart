import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/entities/user.dart';

abstract interface class AuthRepository {
  Future<Result<User>> login({
    required String email,
    required String password,
  });

  Future<Result<User>> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String password_confirmation
  });

  Future<Result<void>> logout();

  Future<bool> getLoggedInUser();
}
