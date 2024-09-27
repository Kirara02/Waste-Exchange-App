import 'package:waste_exchange/data/repositories/credit_repository.dart';
import 'package:waste_exchange/domain/entities/credit.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/usecases/usecase.dart';

class GetCredits implements UseCase<Result<List<Credit>>, void> {
  final CreditRepository _creditRepository;

  GetCredits({
    required CreditRepository creditRepository,
  }) : _creditRepository = creditRepository;

  @override
  Future<Result<List<Credit>>> call(void params) async {
    var results = await _creditRepository.getCredits();

    return switch (results) {
      Success(value: final result) => Result.success(result),
      Failed(:final message) => Result.failed(message)
    };
  }
}
