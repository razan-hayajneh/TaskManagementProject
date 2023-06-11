import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_managment/presentation/screen/sigInScreen.dart';
import 'package:provider/provider.dart';

import '../../data/model/model.dart';
import '../../logic/blocs/blocs.dart';
import '../utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  late User user = User(password: "", confirmPassword: "", fullName: "", phoneNumber: "", email: "");
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool showErrorFullName = false;
  bool showErrorEmail = false;
  bool showErrorPassword = false;
  bool showErrorConfirmPassword = false;
  bool showErrorPhone = false;
   late SignupBloc signupBloc;
  @override
  void initState() {
    signupBloc = context.read<SignupBloc>();

    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    return   MaterialApp(
     debugShowCheckedModeBanner: false,
     home:
     BlocProvider<SignupBloc>(
        create: (context) => signupBloc,
    child: Scaffold(
         backgroundColor: Colors.white,
         appBar: buildAppBar(),
         resizeToAvoidBottomInset: false,
         body: buildSignUpForm(),
       ),
        ),
   );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.purple,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, size: 40),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignInScreen()),
          );
        },
      ),
      leadingWidth: 100,
      title: Text('Sign Up', style: TextStyle(fontSize: 25)),
    );
  }

  Widget buildSignUpForm() {
    final _formKey = GlobalKey<FormState>();

    return
      BlocProvider<SignupBloc>(
        create: (context) => signupBloc,
    child:
      Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
            child :Column(
              children: [
                customWidgetFormFieldBuilder.buildFullNameField(
                  controller: nameController,
                  showError: showErrorFullName,
                ),
                SizedBox(height: 20),
                customWidgetFormFieldBuilder.buildEmailField(
                  controller: emailController,
                  showError: showErrorEmail,
                ),
                SizedBox(height: 20),
                customWidgetFormFieldBuilder.buildPasswordField(
                  controller: passwordController,
                  showError: showErrorPassword,
                ),
                SizedBox(height: 20),
                customWidgetFormFieldBuilder.buildConfirmPasswordField(
                  controller: confirmpasswordController,
                  showError: showErrorConfirmPassword,
                ),
                SizedBox(height: 20),
                customWidgetFormFieldBuilder.buildPhoneField(
                  controller: phoneController,
                  showError: showErrorPhone,
                ),
                SizedBox(height: 20),
                BlocBuilder<SignupBloc, SignupState>(
                  builder: (context, state) {
                    print("stxxxate: $state");

                    if (state is SignupLoading) {
                    } else if (state is SignupSuccess) {
                      print("ssignup: $state");

                      state.showErrorToast();

                    } else if (state is SignupFailure) {
                      state.showErrorToast();
                    }
                    return TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          user = User(password: passwordController.text.toString(),
                              confirmPassword: passwordController.text.toString(),
                              fullName: nameController.text.toString(),
                              phoneNumber: phoneController.text.toString(),
                              email: emailController.text.toString());

                          _handleSignupButtonPressed(user);                    }

                      },
                      child: Text(
                        'Sign Up',
                        style: AppTheme.headline3.withWhite,
                      ),
                      style: Helper.buildButtonStyle(),
                    );
                  },
                ),

                SizedBox(height: 50),
                Helper.buildAlreadyHaveAccountText(context),
               //_SignUpState()
              ],
            ),
          ),
        ),
      ),
      ),
      ),
    );
  }





  Future<void> _handleSignupButtonPressed(User user) async {

    setState(() {
      showErrorFullName = !UserValidator.isFullNameValid(user.fullName);
      showErrorEmail = !UserValidator.isEmailValid(user.email);
      showErrorPassword = !UserValidator.isPasswordValid(user.password);
      showErrorConfirmPassword = !UserValidator.isConfirmPasswordValid(
        user.password,
        user.confirmPassword,
      );
      showErrorPhone = !UserValidator.isPhoneNumberValid(user.phoneNumber);
    });

    if (UserValidator.isValidData(user)) {
      signupBloc.add(SignupButtonPressed(user: user));
    }

    // Perform signup logic
  }


}


