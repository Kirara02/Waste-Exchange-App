import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/entities/history.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/usecases/get_histories/get_histories.dart';
import 'package:waste_exchange/presentation/providers/usecases/get_histories_provider.dart';

part 'histories_provider.g.dart';

@Riverpod(keepAlive: true)
class Histories extends _$Histories {
  @override
  FutureOr<List<History>> build() => const [];

  Future<void> getHistories() async {
    state = const AsyncLoading();

    GetHistories getHistories = ref.read(getHistoriesProvider);

    var result = await getHistories(null);

    switch (result) {
      case Success(value: final histories):
        state = AsyncData(histories);

      case Failed(message: _):
        state = const AsyncData([]);
    }
  }
}
