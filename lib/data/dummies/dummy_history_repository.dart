import 'package:waste_exchange/data/repositories/history_repository.dart';
import 'package:waste_exchange/domain/entities/history.dart';
import 'package:waste_exchange/domain/entities/result.dart';

class DummyHistoryRepository implements HistoryRepository {
  @override
  Future<Result<List<History>>> getHistories() async {
    await Future.delayed(const Duration(seconds: 1));

    List<History> data = [
      History(id: 1, title: "Topup Saldo", datetime: "2024-09-01 12:30", amount: 100000, type: "topup"),
      History(id: 2, title: "Withdraw Saldo", datetime: "2024-09-02 10:15", amount: 50000, type: "transfer"),
      History(id: 3, title: "Topup Saldo", datetime: "2024-09-03 14:45", amount: 75000, type: "topup"),
      History(id: 4, title: "Withdraw Saldo", datetime: "2024-09-05 09:00", amount: 30000, type: "transfer"),
      History(id: 5, title: "Topup Saldo", datetime: "2024-09-06 16:20", amount: 120000, type: "topup"),
      History(id: 6, title: "Withdraw Saldo", datetime: "2024-08-07 08:30", amount: 25000, type: "pulsa"),
      History(id: 7, title: "Topup Saldo", datetime: "2024-08-08 13:10", amount: 90000, type: "topup"),
      History(id: 8, title: "Withdraw Saldo", datetime: "2024-08-09 11:45", amount: 60000, type: "transfer"),
    ];

    return Result.success(data);
  }
}
