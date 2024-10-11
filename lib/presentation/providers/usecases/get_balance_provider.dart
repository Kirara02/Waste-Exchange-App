import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/usecases/get_balance/get_balance.dart';
import 'package:waste_exchange/presentation/providers/repositories/user_repository_provider.dart';

part 'get_balance_provider.g.dart';

@riverpod
GetBalance getBalance(GetBalanceRef ref) => GetBalance(userRepository: ref.watch(userRepositoryProvider));
