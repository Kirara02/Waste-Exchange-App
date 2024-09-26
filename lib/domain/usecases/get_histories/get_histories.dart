import 'package:waste_exchange/data/repositories/history_repository.dart';
import 'package:waste_exchange/domain/entities/history.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/usecases/usecase.dart';

class GetHistories implements UseCase<Result<List<History>>, void> {
  final HistoryRepository _historyRepository;

  GetHistories({
    required HistoryRepository historyRepository,
  }) : _historyRepository = historyRepository;

  @override
  Future<Result<List<History>>> call(_) async {
    var results = await _historyRepository.getHistories();

    return switch (results) {
      Success(value: final result) => Result.success(result),
      Failed(:final message) => Result.failed(message)
    };
  }
}
