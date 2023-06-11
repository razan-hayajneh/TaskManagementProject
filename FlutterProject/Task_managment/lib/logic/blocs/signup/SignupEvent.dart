

import 'package:equatable/equatable.dart';

import '../../../data/model/model.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}
class SignupButtonPressed extends SignupEvent {
  User user ;



  SignupButtonPressed({required this.user});

  @override
  List<Object> get props => [user];

  bool isValid() {
    if (!UserValidator.isValidData(user)) {
      return false;
    }
    return true;
  }
}

