import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:waste_exchange/domain/entities/result.dart';
import 'package:waste_exchange/domain/entities/user.dart';
import 'package:waste_exchange/domain/usecases/get_logged_in_user/get_logged_in_user.dart';
import 'package:waste_exchange/domain/usecases/login/login.dart';
import 'package:waste_exchange/domain/usecases/login/login_params.dart';
import 'package:waste_exchange/domain/usecases/logout/logout.dart';
import 'package:waste_exchange/domain/usecases/register/register.dart';
import 'package:waste_exchange/domain/usecases/register/register_params.dart';
import 'package:waste_exchange/presentation/providers/history/histories_provider.dart';
import 'package:waste_exchange/presentation/providers/usecases/get_presence_detail_provider.dart';
import 'package:waste_exchange/presentation/providers/usecases/login_provider.dart';
import 'package:waste_exchange/presentation/providers/usecases/logout_provider.dart';
import 'package:waste_exchange/presentation/providers/usecases/register_provider.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  FutureOr<User?> build() async {
    GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);

    var userResult = await getLoggedInUser(null);

    switch (userResult) {
      case Success(value: final user):
        _getHistory();
        return user;
      case Failed(message: _):
        return null;
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();

    Login login = ref.read(loginProvider);

    var result = await login(LoginParams(email: email, password: password));

    switch (result) {
      case Success(value: final user):
        state = AsyncData(user);
        _getHistory();
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> register({required RegisterParams params}) async {
    state = const AsyncLoading();

    Register register = ref.read(registerProvider);

    var result = await register(params);

    switch (result) {
      case Success(value: final user):
        state = AsyncData(user);
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> logout() async {
    Logout logout = ref.read(logoutProvider);
    var result = await logout(null);

    switch (result) {
      case Success(value: _):
        state = const AsyncData(null);
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = AsyncData(state.valueOrNull);
    }
  }

  void _getHistory() {
    ref.read(historiesProvider.notifier).getHistories();
  }
}
