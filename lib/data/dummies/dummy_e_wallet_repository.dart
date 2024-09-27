import 'package:waste_exchange/data/repositories/e_wallet_repository.dart';
import 'package:waste_exchange/domain/entities/e_wallet.dart';
import 'package:waste_exchange/domain/entities/result.dart';

class DummyEWalletRepository implements EWalletRepository {
  @override
  Future<Result<List<EWallet>>> getEwallets() async {
    await Future.delayed(const Duration(seconds: 1));
    List<EWallet> data = [
      EWallet(id: 1, name: "Dana", iconPath: "assets/images/dana.png"),
      EWallet(id: 2, name: "Shoope Pay", iconPath: "assets/images/shoopepay.png"),
      EWallet(id: 3, name: "OVO", iconPath: "assets/images/ovo.png"),
      EWallet(id: 4, name: "GoPay", iconPath: "assets/images/gopay.png"),
      EWallet(id: 5, name: "Link Aja", iconPath: "assets/images/linkaja.png"),
    ];
    return Result.success(data);
  }
}
