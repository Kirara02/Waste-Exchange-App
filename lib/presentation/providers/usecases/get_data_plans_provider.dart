import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/usecases/get_data_plans/get_data_plans.dart';
import 'package:waste_exchange/presentation/providers/repositories/data_plan_repository_provider.dart';

part 'get_data_plans_provider.g.dart';

@riverpod
GetDataPlans getDataPlans(GetDataPlansRef ref) =>
    GetDataPlans(dataPlanRepository: ref.read(dataPlanRepositoryProvider));
