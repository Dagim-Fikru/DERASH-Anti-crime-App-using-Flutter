abstract class AuthEvent {}

class SignUp extends AuthEvent {
    final String username;
    final String email;
    final String password;
    final String confirmPass;

    SignUp(this.username,this.email,this.password,this.confirmPass);


}