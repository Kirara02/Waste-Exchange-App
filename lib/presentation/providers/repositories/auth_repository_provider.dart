import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/data/api/api_auth_repository.dart';
import 'package:waste_exchange/data/repositories/auth_repository.dart';

part 'auth_repository_provider.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) => ApiAuthRepository();
