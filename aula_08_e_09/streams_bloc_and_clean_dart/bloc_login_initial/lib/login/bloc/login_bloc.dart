import 'package:bloc/bloc.dart';
import 'package:register/login/bloc/login_events.dart';
import 'package:register/login/bloc/login_states.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginInitialState()) {
    on<DoLoginEvent>((event, emit) async {
      emit(const LoginProcessingState());

      Future.delayed(const Duration(seconds: 3)).then((value) {
        if (event.password == "123") {
          emit(const LoginSuccessState());
        } else {
          emit(const LoginFailedState('Credenciais inválidas'));
        }
      });
    });
  }
}
