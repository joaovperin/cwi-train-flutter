abstract class LoginEvent {
  const LoginEvent();
}

class DoLoginEvent extends LoginEvent {
  final String email;
  final String password;

  const DoLoginEvent(this.email, this.password);
}
