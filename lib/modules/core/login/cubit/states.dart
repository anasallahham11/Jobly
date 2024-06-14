abstract class LoginStates{}


class LoginIntStates extends LoginStates{}

class LoginLoadingStates extends LoginStates{}

class LoginSuccessStates extends LoginStates{}

class LoginErorrStates extends LoginStates
{
  final String erorr;

  LoginErorrStates(this.erorr);
}