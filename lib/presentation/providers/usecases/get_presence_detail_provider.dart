import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/usecases/get_logged_in_user/get_logged_in_user.dart';
import 'package:waste_exchange/presentation/providers/repositories/auth_repository_provider.dart';
import 'package:waste_exchange/presentation/providers/repositories/user_repository_provider.dart';

part 'get_presence_detail_provider.g.dart';

@riverpod
GetLoggedInUser getLoggedInUser(GetLoggedInUserRef ref) => GetLoggedInUser(
    authRepository: ref.watch(authRepositoryProvider), userRepository: ref.watch(userRepositoryProvider));
