import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/usecases/change_password/change_password.dart';
import 'package:waste_exchange/presentation/providers/repositories/user_repository_provider.dart';

part 'change_password_provider.g.dart';

@riverpod
ChangePassword changePassword(ChangePasswordRef ref) =>
    ChangePassword(userRepository: ref.watch(userRepositoryProvider));
