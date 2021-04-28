part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginDone extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginError extends LoginState {
  @override
  List<Object> get props => [];
}
