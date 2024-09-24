import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> getUser();
}
