import 'package:waste_exchange/data/repositories/credit_repository.dart';
import 'package:waste_exchange/domain/entities/credit.dart';
import 'package:waste_exchange/domain/entities/result.dart';

class DummyCreditRepository implements CreditRepository {
  @override
  Future<Result<List<Credit>>> getCredits() async {
    await Future.delayed(const Duration(seconds: 1));
    List<Credit> data = [
      Credit(id: 1, amount: 5000, price: 7000),
      Credit(id: 2, amount: 10000, price: 12000),
      Credit(id: 3, amount: 20000, price: 22000),
      Credit(id: 4, amount: 25000, price: 27000),
      Credit(id: 5, amount: 50000, price: 52000),
      Credit(id: 6, amount: 100000, price: 102000),
    ];
    return Result.success(data);
  }
}
