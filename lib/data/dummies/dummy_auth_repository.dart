import 'package:waste_exchange/data/repositories/auth_repository.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/entities/user.dart';
import 'package:waste_exchange/presentation/misc/token_helper.dart';

class DummyAuthRepository implements AuthRepository {
  @override
  Future<Result<User>> login({required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 1));
    await TokenHelper().setLoginStatus(true);

    return Result.success(User(id: 1, name: 'Kirara Bernstein', email: 'kirara@gmail.com'));
  }

  @override
  Future<Result<void>> logout() async {
    await Future.delayed(const Duration(seconds: 1));
    await TokenHelper().setLoginStatus(false);
    return const Result.success(null);
  }

  @override
  Future<bool> getLoggedInUser() async {
    var result = await TokenHelper().getLoginStatus();
    return result;
  }

  @override
  Future<Result<User>> register({
    required String name,
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(seconds: 1));

    return Result.success(User(id: 1, name: 'Kirara Bernstein', email: 'kirara@gmail.com'));
  }
}
