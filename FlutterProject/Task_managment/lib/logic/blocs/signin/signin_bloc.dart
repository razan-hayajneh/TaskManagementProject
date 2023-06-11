import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment/data/repositories/AuthRepository.dart';
import 'package:task_managment/logic/blocs/signin/signin_event.dart';
import 'package:task_managment/logic/blocs/signin/signin_state.dart';

import '../../../presentation/screen/sigInScreen.dart';

class SignInBloc extends Bloc<SignInEvent, LoginState> {

  SignInBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(SignInEvent event) async* {

    if (event is SignInButtonPressed) {

      yield LoginLoading();
      try {

        var responseData = await AuthRepository.login(event.user);
        if (responseData['success'] == false) {
          yield LoginFailure(error: responseData['message']);

        }
        else
          {
            final message = responseData['message'];
            final token = responseData['data']['token'];
            final userType = responseData['data']['user_type'];
            print(message);
            yield LoginSuccess(token: token, userType: userType, message: message );



          }


      } catch (error) {
        print(error.toString());

        yield LoginFailure(error: error.toString());
      }
    }
  }
}
