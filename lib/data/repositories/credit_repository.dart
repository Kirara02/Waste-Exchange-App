import 'package:waste_exchange/domain/entities/credit.dart';
import 'package:waste_exchange/domain/entities/result.dart';

abstract interface class CreditRepository {
  Future<Result<List<Credit>>> getCredits();
}
