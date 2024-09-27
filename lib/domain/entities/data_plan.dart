import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_plan.freezed.dart';
part 'data_plan.g.dart';

@freezed
class DataPlan with _$DataPlan {
  factory DataPlan({
    required int id,
    required String name,
    required double price,
    required String expired,
    String? desc,
  }) = _DataPlan;

  factory DataPlan.fromJson(Map<String, dynamic> json) => _$DataPlanFromJson(json);
}
