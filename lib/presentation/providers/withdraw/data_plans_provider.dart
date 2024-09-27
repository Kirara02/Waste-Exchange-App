import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/entities/data_plan.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/usecases/get_data_plans/get_data_plans.dart';
import 'package:waste_exchange/presentation/providers/usecases/get_data_plans_provider.dart';

part 'data_plans_provider.g.dart';

@riverpod
class DataPlans extends _$DataPlans {
  @override
  FutureOr<List<DataPlan>> build() => const [];

  Future<void> getDataPlans({required String phone}) async {
    state = const AsyncLoading();

    GetDataPlans getDataPlans = ref.read(getDataPlansProvider);

    var result = await getDataPlans(null);
    
    switch (result) {
      case Success(value: final data):
        state = AsyncData(data);
      case Failed(message: _):
        state = const AsyncData([]);
    }
  }
}
