import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/data/api/api_user_repository.dart';
import 'package:waste_exchange/data/repositories/user_repository.dart';

part 'user_repository_provider.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) => ApiUserRepository();
