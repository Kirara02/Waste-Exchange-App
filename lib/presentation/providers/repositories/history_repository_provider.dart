import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/data/dummies/dummy_history_repository.dart';
import 'package:waste_exchange/data/repositories/history_repository.dart';

part 'history_repository_provider.g.dart';

@riverpod
HistoryRepository historyRepository(HistoryRepositoryRef ref) => DummyHistoryRepository();
