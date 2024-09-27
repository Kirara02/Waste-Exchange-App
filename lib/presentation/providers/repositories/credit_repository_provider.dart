import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/data/dummies/dummy_credit_repository.dart';
import 'package:waste_exchange/data/repositories/credit_repository.dart';

part 'credit_repository_provider.g.dart';

@riverpod
CreditRepository creditRepository(CreditRepositoryRef ref) => DummyCreditRepository();
