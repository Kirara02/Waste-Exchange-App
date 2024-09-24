import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/usecases/register/register.dart';
import 'package:waste_exchange/presentation/providers/repositories/auth_repository_provider.dart';

part 'register_provider.g.dart';

@riverpod
Register register(RegisterRef ref) => Register(authRepository: ref.watch(authRepositoryProvider));
