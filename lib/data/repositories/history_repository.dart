import 'package:waste_exchange/domain/entities/history.dart';
import 'package:waste_exchange/domain/entities/result.dart';

abstract interface class HistoryRepository {
  Future<Result<List<History>>> getHistories();
}
