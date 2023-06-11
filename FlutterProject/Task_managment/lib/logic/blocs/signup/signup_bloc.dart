import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment/data/model/user.dart';
import 'package:task_managment/data/repositories/AuthRepository.dart';
import '../blocs.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial());

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupButtonPressed) {
      yield SignupLoading();
      try {
        final response = await AuthRepository.signUp(event.user as User);
        yield SignupSuccess();
      } catch (error) {
        yield SignupFailure(error: error.toString());
      }
    }
  }
}
