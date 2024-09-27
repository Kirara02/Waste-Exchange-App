import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/data/dummies/dummy_data_plan_repository.dart';
import 'package:waste_exchange/data/repositories/data_plan_repository.dart';

part 'data_plan_repository_provider.g.dart';

@riverpod
DataPlanRepository dataPlanRepository(DataPlanRepositoryRef ref) => DummyDataPlanRepository();
