
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_managment/presentation/utils/app_theme.dart';

import '../../../data/model/model.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {

}

class SignupLoading extends SignupState {

}

class SignupSuccess extends SignupState {

  void showErrorToast() {
    Fluttertoast.showToast(
      msg: "Success",
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: AppTheme.lightPurple,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }


}

class SignupFailure extends SignupState {
  final String error;

  SignupFailure({required this.error}

      );

  @override
  List<Object> get props => [error];
   void showErrorToast() {
    Fluttertoast.showToast(
      msg: "error",
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: AppTheme.lightPurple,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}