import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/usecases/get_histories/get_histories.dart';
import 'package:waste_exchange/presentation/providers/repositories/history_repository_provider.dart';

part 'get_histories_provider.g.dart';

@riverpod
GetHistories getHistories(GetHistoriesRef ref) => GetHistories(historyRepository: ref.watch(historyRepositoryProvider));
