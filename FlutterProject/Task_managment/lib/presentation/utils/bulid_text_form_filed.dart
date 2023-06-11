import 'package:flutter/material.dart';
import '../utils/utils.dart';
import 'utils.dart';
class customWidgetFormFieldBuilder {
  static Widget buildFullNameField({
    required TextEditingController controller,
    required bool showError,
  }) {
    return CustomTextFormField(
      controller: controller,
      labelText: 'Please enter your Full Name',
      errorText: showError ? Keys.FullNameerrorText : null,
      errorStyle: AppTheme.texterrorstyle,
    );
  }

  static Widget buildEmailField({
    required TextEditingController controller,
    required bool showError,
  }) {
    return CustomTextFormField(
      controller: controller,
      labelText: 'Enter your email',
      errorText: showError ? Keys.emailErrorText : null,
      errorStyle: AppTheme.texterrorstyle,
    );
  }

  static Widget buildPasswordField({
    required TextEditingController controller,
    required bool showError,
  }) {
    return CustomTextFormField(
      controller: controller,
      labelText: 'Please enter your password',
      errorText: showError ? Keys.passwordErrorText : null,
      errorStyle: AppTheme.texterrorstyle,
    );
  }

  static Widget buildConfirmPasswordField({
    required TextEditingController controller,
    required bool showError,
  }) {
    return CustomTextFormField(
      controller: controller,
      labelText: 'Please confirm your password',
      errorText: showError ? Keys.passwordConfirmErrorText : null,
      errorStyle: AppTheme.texterrorstyle,
    );
  }

  static Widget buildPhoneField({
    required TextEditingController controller,
    required bool showError,
  }) {
    return CustomTextFormField(
      controller: controller,
      labelText: 'Enter your PhoneNumber',
      errorText: showError ? Keys.phoneerrorText : null,
      errorStyle: AppTheme.texterrorstyle,
    );
  }
}
class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextStyle? errorStyle;
  final String? errorLabel;
  final String? errorText;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.errorStyle,
    this.errorLabel,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.purple),
        ),
        suffixIcon: suffixIcon,
        errorStyle: errorStyle,
        errorText: errorText,
        errorMaxLines: 2,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
    );
  }
}
