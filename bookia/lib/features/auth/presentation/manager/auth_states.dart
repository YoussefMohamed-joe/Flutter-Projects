import 'package:bookia/features/auth/data/models/post_auth_response/post_auth_response.dart';

class AuthStates {}

class AuthInitialState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final PostAuthResponse postAuthResponse;

  LoginSuccessState(this.postAuthResponse);
}

class LoginErrorState extends AuthStates {
  final String error;

  LoginErrorState(this.error);
}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {
  final PostAuthResponse postAuthResponse;

  RegisterSuccessState(this.postAuthResponse);
}

class RegisterErrorState extends AuthStates {
  final String error;

  RegisterErrorState(this.error);
}
