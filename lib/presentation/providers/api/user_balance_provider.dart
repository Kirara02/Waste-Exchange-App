import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/entities/balance.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/usecases/get_balance/get_balance.dart';
import 'package:waste_exchange/presentation/providers/usecases/get_balance_provider.dart';

part 'user_balance_provider.g.dart';

@Riverpod(keepAlive: true)
class UserBalance extends _$UserBalance {
  @override
  FutureOr<Balance> build() => Balance(balance: 0);

  Future<void> getBalance() async {
    state = const AsyncLoading();

    GetBalance getBalance = ref.read(getBalanceProvider);

    var result = await getBalance(null);
    
    switch (result) {
      case Success(value: final value):
        state = AsyncData(value);

      case Failed(message: _):
        state = AsyncData(Balance(balance: 0));
    }
  }
}
