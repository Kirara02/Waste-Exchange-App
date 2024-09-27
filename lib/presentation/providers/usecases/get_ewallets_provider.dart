import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/usecases/get_ewallets/get_ewallets.dart';
import 'package:waste_exchange/presentation/providers/repositories/e_wallet_repository_provider.dart';

part 'get_ewallets_provider.g.dart';

@riverpod
GetEwallets getEwallets(GetEwalletsRef ref) => GetEwallets(eWalletRepository: ref.read(eWalletRepositoryProvider));
