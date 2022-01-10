import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_chat/domain/entities/request/no_params.dart';
import 'package:firebase_chat/domain/usecases/login_usecase.dart';
import 'package:firebase_chat/domain/usecases/logout_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUC _loginUC;
  final LogoutUC _logoutUC;

  AuthCubit(
    this._loginUC,
    this._logoutUC,
  ) : super(AuthInitialState());

  Future<void> login() async {
    final response = await _loginUC(NoParams());
    emit(response.fold(
      (l) => const UnauthenticatedState(),
      (r) => AuthenticatedState(),
    ));
  }

  Future<void> logout() async {
    emit(const UnauthenticatedState());
    await _logoutUC(NoParams());
  }
}
