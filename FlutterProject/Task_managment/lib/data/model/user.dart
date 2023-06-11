class User {
  String _password = '';
  String _confirmPassword = '';
  String _fullName = '';
  String _phoneNumber = '';
  String _email = '';
  User.withEmailAndPassword({
    required String email,
    required String password,
  }) {
    _email = email;
    _password = password;
  }

  User({
    required String password,
    required String confirmPassword,
    required String fullName,
    required String phoneNumber,
    required String email,
  }) {
    _password = password;
    _confirmPassword = confirmPassword;
    _fullName = fullName;
    _phoneNumber = phoneNumber;
    _email = email;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get confirmPassword => _confirmPassword;

  set confirmPassword(String value) {
    _confirmPassword = value;
  }

  String get fullName => _fullName;

  set fullName(String value) {
    _fullName = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }
}

class UserValidator {
  static bool isValidData(User user) {
    return isPasswordValid(user.password) &&
        isConfirmPasswordValid(user.password, user.confirmPassword) &&
        isFullNameValid(user.fullName) &&
        isPhoneNumberValid(user.phoneNumber) &&
        isEmailValid(user.email);
  }

  static bool isPasswordValid(String password) {
    return password.isNotEmpty && password.length > 6;
  }

  static bool isConfirmPasswordValid(String password, String confirmPassword) {
    return confirmPassword.isNotEmpty  && confirmPassword== password;
  }

  static bool isFullNameValid(String fullName) {
    return fullName.isNotEmpty;
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    return phoneNumber.isNotEmpty && phoneNumber.length == 10 ;
  }

  static bool isEmailValid(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
    );
    return emailRegex.hasMatch(email);
  }
}

