class AuthStates {}

class LogInScreenState extends AuthStates {}

class HomeScreenState extends AuthStates {
  final String username;
  HomeScreenState(this.username);
}

class SignUpScreenState extends AuthStates {}

class FailureState extends AuthStates {}
