import 'package:waste_exchange/domain/entities/data_plan.dart';
import 'package:waste_exchange/domain/entities/result.dart';

abstract interface class DataPlanRepository {
  Future<Result<List<DataPlan>>> getDataPlans();
}
