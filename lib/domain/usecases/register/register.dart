import 'package:waste_exchange/data/repositories/auth_repository.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/entities/user.dart';
import 'package:waste_exchange/domain/usecases/register/register_params.dart';
import 'package:waste_exchange/domain/usecases/usecase.dart';

class Register implements UseCase<Result<User>, RegisterParams> {
  final AuthRepository _authRepository;

  Register({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Result<User>> call(RegisterParams params) async {
    var results = await _authRepository.register(name: params.name, email: params.email, password: params.password);

    return switch (results) {
      Success(value: final result) => Result.success(result),
      Failed(:final message) => Result.failed(message)
    };
  }
}
