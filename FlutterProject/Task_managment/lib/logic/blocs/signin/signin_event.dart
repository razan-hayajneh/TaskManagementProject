import 'package:equatable/equatable.dart';
import 'package:task_managment/data/model/user.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInButtonPressed extends SignInEvent {
  User user ;

  SignInButtonPressed({required this.user});

  @override
  List<Object> get props => [user];
}
