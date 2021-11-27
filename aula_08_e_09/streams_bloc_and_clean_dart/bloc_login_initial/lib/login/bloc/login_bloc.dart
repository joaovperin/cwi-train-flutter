import 'package:bloc/bloc.dart';
import 'package:register/login/bloc/login_events.dart';
import 'package:register/login/bloc/login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitialState()) {
    on<DoLoginEvent>(_handleLoginEvent);
    on<ConfirmVerificationCodeEvent>(_handleConfirmVerificationCodeEvent);
  }

  Future<void> _handleLoginEvent(
      DoLoginEvent event, Emitter<LoginState> emit) async {
    emit(const LoadingState());

    await _simulateHttpRequest();

    if (event.password == "123") {
      emit(const LoginSuccessState());
    } else {
      emit(const LoginFailedState('Credenciais inválidas'));
    }
  }

  Future<void> _handleConfirmVerificationCodeEvent(
      ConfirmVerificationCodeEvent event, Emitter<LoginState> emit) async {
    emit(const LoadingState());

    await _simulateHttpRequest();
    if (event.verificationCode == "9999") {
      emit(const LoginSuccessState());
    } else {
      emit(const LoginFailedState('Código de acesso inválido'));
    }
  }

  Future<void> _simulateHttpRequest() {
    return Future.delayed(const Duration(seconds: 2));
  }
}
