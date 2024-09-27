import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/data/dummies/dummy_e_wallet_repository.dart';
import 'package:waste_exchange/data/repositories/e_wallet_repository.dart';

part 'e_wallet_repository_provider.g.dart';

@riverpod
EWalletRepository eWalletRepository(EWalletRepositoryRef ref) => DummyEWalletRepository();
