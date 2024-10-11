import 'package:waste_exchange/data/repositories/user_repository.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/entities/user.dart';
import 'package:waste_exchange/domain/usecases/edit_profile/edit_profile_params.dart';
import 'package:waste_exchange/domain/usecases/usecase.dart';

class EditProfile implements UseCase<Result<User>, EditProfileParams> {
  final UserRepository _userRepository;

  EditProfile({required UserRepository userRepository}) : _userRepository = userRepository;

  @override
  Future<Result<User>> call(EditProfileParams params) async {
    final result = await _userRepository.updateProfile(
      name: params.name,
      phoneNumber: params.phone,
      email: params.email,
    );

    return switch (result) {
      Success(:final value) => Result.success(value),
      Failed(:final message) => Result.failed(message)
    };
  }
}
