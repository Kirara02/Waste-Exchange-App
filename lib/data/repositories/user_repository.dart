import 'package:waste_exchange/domain/entities/balance.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> getUser();
  Future<Result<Balance>> getBalance();
  Future<Result<User>> updateProfile({
    required String name,
    required String phoneNumber,
    required String email,
  });
  Future<Result<String>> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}
