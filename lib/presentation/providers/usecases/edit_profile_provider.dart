import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/usecases/edit_profile/edit_profile.dart';
import 'package:waste_exchange/presentation/providers/repositories/user_repository_provider.dart';

part 'edit_profile_provider.g.dart';

@riverpod
EditProfile editProfile(EditProfileRef ref) => EditProfile(userRepository: ref.watch(userRepositoryProvider));
