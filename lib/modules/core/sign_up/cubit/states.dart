abstract class SignupStates{}


class SignupIntStates extends SignupStates{}

class SignupLoadingStates extends SignupStates{}

class SignupSuccessStates extends SignupStates{}

class SignupErorrStates extends SignupStates
{
  final String erorr;

  SignupErorrStates(this.erorr);
}