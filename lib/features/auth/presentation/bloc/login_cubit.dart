import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injector.dart';
import '../../../../core/services/local_storage_service.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    final tokenStorageService = sl<TokenStorageService>();

    emit(LoginLoading());

    final result = await loginUseCase(email, password);

    result.fold((failure) => emit(LoginFailure(failure)), (user) async {
      await tokenStorageService.saveToken(user.jwt); // ✅ guardamos token seguro
      emit(LoginSuccess(user.jwt));
    });
  }
}
