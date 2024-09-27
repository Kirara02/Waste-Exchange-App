import 'package:waste_exchange/data/repositories/e_wallet_repository.dart';
import 'package:waste_exchange/domain/entities/e_wallet.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/usecases/usecase.dart';

class GetEwallets implements UseCase<Result<List<EWallet>>, void> {
  final EWalletRepository _eWalletRepository;

  GetEwallets({
    required EWalletRepository eWalletRepository,
  }) : _eWalletRepository = eWalletRepository;

  @override
  Future<Result<List<EWallet>>> call(void params) async {
    var results = await _eWalletRepository.getEwallets();

    return switch (results) {
      Success(value: final result) => Result.success(result),
      Failed(:final message) => Result.failed(message)
    };
  }
}
