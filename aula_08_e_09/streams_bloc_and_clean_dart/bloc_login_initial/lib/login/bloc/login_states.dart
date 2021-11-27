abstract class LoginState {
  const LoginState();
}

class LoginInitialState extends LoginState {
  const LoginInitialState();
}

class LoadingState extends LoginState {
  const LoadingState();
}

class LoginSuccessState extends LoginState {
  const LoginSuccessState();
}

class LoginFailedState extends LoginState {
  const LoginFailedState(this.message);

  final String message;
}
