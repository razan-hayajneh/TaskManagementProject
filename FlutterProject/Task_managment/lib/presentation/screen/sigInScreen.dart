import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_managment/data/model/model.dart';
import 'package:task_managment/logic/blocs/signin/signin_bloc.dart';
import 'package:task_managment/logic/blocs/signin/signin_event.dart';
import 'package:task_managment/logic/blocs/signin/signin_state.dart';
import '../utils/utils.dart';
import 'baseScreen.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late User user = User.withEmailAndPassword(email: "", password: "");
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  late SignInBloc loginBloc;
  final TextEditingController passwordController = TextEditingController();
  bool showErrorEmail = false;
  bool showErrorPassword = false;

  @override
  void initState() {

    loginBloc = context.read<SignInBloc>();
    super.initState();
  }
  @override
  void dispose() {
    loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<SignInBloc>(
        create: (context) => loginBloc,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: null,
          resizeToAvoidBottomInset: false,
          body: buildSignInForm(),
        ),
      ),
    );
  }

  Widget buildSignInForm() {
    var buildSignUpText = Helper.buildSignUpText(context);
    return BlocProvider<SignInBloc>(
      create: (context) => loginBloc,
      child: Padding(
        padding: EdgeInsets.only(top: 100.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
    child:Column(
              children: [
                Image(
                  image: AssetImage('assets/images/logo.png'),
                  width: 300,
                  height: 250,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: <Widget>[
                      customWidgetFormFieldBuilder.buildEmailField(
                        controller: emailController,
                        showError: showErrorEmail,
                      ),
                      SizedBox(height: 50),
                      customWidgetFormFieldBuilder.buildPasswordField(
                        controller: passwordController,
                        showError: showErrorPassword,
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
                BlocBuilder<SignInBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {


                    } else if (state is LoginFailure) {

                     Helper.showToast( state.error);

                    } else if (state is LoginSuccess) {
                      CreateSharedPrefrence(state.token);
                      Helper.getTokenFromSharedPreferences();
                      Helper.showToast( state.message);
                      Helper.navigateToNextScreen(context, BasePage());
                    }
                    return
                      TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          user = User.withEmailAndPassword(
                            password: passwordController.text.toString(),
                            email: emailController.text.toString(),
                          );
                          _handleSignupButtonPressed(user);
                         // Helper.navigateToNextScreen(context, SignInScreen());
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: AppTheme.headline3.withWhite,
                      ),
                      style: Helper.buildButtonStyle(),
                    );

                  },
                ),
                SizedBox(height: 50),
                buildSignUpText,
              //  _buildLoginState(),
              ],
            ),
            )
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignupButtonPressed(User user) async {
    setState(() {
      showErrorEmail = !UserValidator.isEmailValid(user.email);
      showErrorPassword = !UserValidator.isPasswordValid(user.password);
    });

    if (!showErrorPassword && !showErrorEmail) {
      loginBloc.add(SignInButtonPressed(user: user));
    }
  }

}



Future<void> CreateSharedPrefrence(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}
