import 'package:waste_exchange/data/repositories/data_plan_repository.dart';
import 'package:waste_exchange/domain/entities/data_plan.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/usecases/usecase.dart';

class GetDataPlans implements UseCase<Result<List<DataPlan>>, void> {
  final DataPlanRepository _dataPlanRepository;

  GetDataPlans({required DataPlanRepository dataPlanRepository}) : _dataPlanRepository = dataPlanRepository;
  @override
  Future<Result<List<DataPlan>>> call(void params)async {
    var results = await _dataPlanRepository.getDataPlans();

    return switch (results) {
      Success(value: final result) => Result.success(result),
      Failed(:final message) => Result.failed(message)
    };
  }
}
