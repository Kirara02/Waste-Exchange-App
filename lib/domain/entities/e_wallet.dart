import 'package:freezed_annotation/freezed_annotation.dart';

part 'e_wallet.freezed.dart';
part 'e_wallet.g.dart';

@freezed
class EWallet with _$EWallet {
  factory EWallet({
    required int id,
    required String name,
    required String iconPath,
  }) = _EWallet;

  factory EWallet.fromJson(Map<String, dynamic> json) => _$EWalletFromJson(json);
}
