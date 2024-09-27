import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit.freezed.dart';
part 'credit.g.dart';

@freezed
class Credit with _$Credit {
  factory Credit({
    required int id,
    required double amount,
    required double price,
  }) = _Credit;

  factory Credit.fromJson(Map<String, dynamic> json) => _$CreditFromJson(json);
}
