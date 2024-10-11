import 'package:waste_exchange/data/repositories/user_repository.dart';
import 'package:waste_exchange/domain/entities/balance.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/usecases/usecase.dart';

class GetBalance implements UseCase<Result<Balance>, void> {
  final UserRepository _userRepository;

  GetBalance({required UserRepository userRepository}) : _userRepository = userRepository;

  @override
  Future<Result<Balance>> call(_) async {
    var results = await _userRepository.getBalance();

    return switch (results) {
      Success(value: final result) => Result.success(result),
      Failed(:final message) => Result.failed(message)
    };
  }
}
