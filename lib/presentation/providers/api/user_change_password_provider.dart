import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/usecases/change_password/change_password.dart';
import 'package:waste_exchange/domain/usecases/change_password/change_password_params.dart';
import 'package:waste_exchange/presentation/providers/usecases/change_password_provider.dart';

part 'user_change_password_provider.g.dart';

@riverpod
class UserChangePassword extends _$UserChangePassword {
  @override
  FutureOr<String?> build() => null;

  Future<void> changePassword({required ChangePasswordParams params}) async {
    state = const AsyncLoading();

    ChangePassword changePassword = ref.read(changePasswordProvider);

    var result = await changePassword(params);

    switch (result) {
      case Success(value: final message):
        state = AsyncData(message);
      case Failed(:final message):
        state = AsyncError(message, StackTrace.current);
    }
  }
}
