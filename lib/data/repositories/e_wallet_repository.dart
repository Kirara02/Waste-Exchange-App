import 'package:waste_exchange/domain/entities/e_wallet.dart';
import 'package:waste_exchange/domain/entities/result.dart';

abstract interface class EWalletRepository {
  Future<Result<List<EWallet>>> getEwallets();
}