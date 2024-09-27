import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/entities/e_wallet.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/entities/user.dart';
import 'package:waste_exchange/domain/usecases/get_ewallets/get_ewallets.dart';
import 'package:waste_exchange/presentation/providers/usecases/get_ewallets_provider.dart';
import 'package:waste_exchange/presentation/providers/user_data/user_data_provider.dart';

part 'ewallets_provider.g.dart';

@riverpod
class Ewallets extends _$Ewallets {
  @override
  FutureOr<List<EWallet>> build() async {
    User? user = ref.read(userDataProvider).valueOrNull;
    if (user != null) {
      GetEwallets getEwallets = ref.read(getEwalletsProvider);

      var result = await getEwallets(null);

      if (result case Success(value: final data)) {
        return data;
      }
    }
    return const [];
  }
}
