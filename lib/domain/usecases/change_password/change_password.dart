import 'package:waste_exchange/data/repositories/user_repository.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/usecases/change_password/change_password_params.dart';
import 'package:waste_exchange/domain/usecases/usecase.dart';

class ChangePassword implements UseCase<Result<String>, ChangePasswordParams> {
  final UserRepository _userRepository;

  ChangePassword({required UserRepository userRepository}) : _userRepository = userRepository;

  @override
  Future<Result<String>> call(ChangePasswordParams params) async {
    final result = await _userRepository.changePassword(
      currentPassword: params.currentPassword,
      newPassword: params.newPassword,
    );

    return switch (result) {
      Success(:final value) => Result.success(value),
      Failed(:final message) => Result.failed(message)
    };
  }
}
