import 'package:waste_exchange/data/repositories/auth_repository.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/usecases/usecase.dart';

class Logout implements UseCase<Result<void>, void> {
  final AuthRepository _authRepository;

  Logout({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  Future<Result<void>> call(void params) {
    return _authRepository.logout();
  }
}
