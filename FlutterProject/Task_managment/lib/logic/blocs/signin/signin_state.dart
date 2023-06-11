import 'package:equatable/equatable.dart';
import 'package:task_managment/data/model/user.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {



}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;
  final String userType;
  final String message;


  const LoginSuccess({required this.token, required this.userType,required this.message});

  @override
  List<Object> get props => [token, userType];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];

}
