import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/usecases/login/login.dart';
import 'package:waste_exchange/presentation/providers/repositories/auth_repository_provider.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) => Login(authRepository: ref.watch(authRepositoryProvider));
