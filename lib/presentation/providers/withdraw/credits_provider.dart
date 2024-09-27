import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/entities/credit.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/usecases/get_credits/get_credits.dart';
import 'package:waste_exchange/presentation/providers/usecases/get_credits_provider.dart';

part 'credits_provider.g.dart';

@riverpod
class Credits extends _$Credits {
  @override
  FutureOr<List<Credit>> build() => const [];

  Future<void> getCredits({required String phone}) async {
    state = const AsyncLoading();

    GetCredits getCredits = ref.read(getCreditsProvider);

    var result = await getCredits(null);

    switch (result) {
      case Success(value: final data):
        state = AsyncData(data);
      case Failed(message: _):
        state = const AsyncData([]);
    }
  }
}
