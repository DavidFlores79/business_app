import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    final result = await loginUseCase(email, password);

    result.fold(
      (failure) => emit(LoginFailure(failure)),
      (user) => emit(LoginSuccess(user.jwt)),
    );
  }
}
