abstract class LoginEvent {
  const LoginEvent();
}

class DoLoginEvent extends LoginEvent {
  final String email;
  final String password;

  const DoLoginEvent(this.email, this.password);
}

class ConfirmVerificationCodeEvent extends LoginEvent {
  final String verificationCode;

  const ConfirmVerificationCodeEvent(this.verificationCode);
}
