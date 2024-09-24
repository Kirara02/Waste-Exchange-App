import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/usecases/logout/logout.dart';
import 'package:waste_exchange/presentation/providers/repositories/auth_repository_provider.dart';

part 'logout_provider.g.dart';

@riverpod
Logout logout(LogoutRef ref) => Logout(authRepository: ref.watch(authRepositoryProvider));
