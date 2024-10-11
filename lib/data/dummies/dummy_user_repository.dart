import 'package:waste_exchange/data/repositories/user_repository.dart';
import 'package:waste_exchange/domain/entities/balance.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/entities/user.dart';

class DummyUserRepository implements UserRepository {
  @override
  Future<Result<User>> getUser() async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.success(User(id: 1, name: 'Kirara Bernstein', email: 'kirara@gmail.com', phone: "081313320710"));
  }

  @override
  Future<Result<Balance>> getBalance() {
    // TODO: implement getBalance
    throw UnimplementedError();
  }

  @override
  Future<Result<String>> changePassword({required String currentPassword, required String newPassword}) {
    // TODO: implement changePassword
    throw UnimplementedError();
  }

  @override
  Future<Result<User>> updateProfile({required String name, required String phoneNumber, required String email}) {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
}
