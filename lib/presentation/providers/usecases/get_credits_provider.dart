import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/usecases/get_credits/get_credits.dart';
import 'package:waste_exchange/presentation/providers/repositories/credit_repository_provider.dart';

part 'get_credits_provider.g.dart';

@riverpod
GetCredits getCredits(GetCreditsRef ref) => GetCredits(creditRepository: ref.read(creditRepositoryProvider));
