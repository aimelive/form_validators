import 'package:formz/formz.dart';

/// Tells password validation error type
enum PasswordValidatorError { empty, invalid }

class Password extends FormzInput<String, PasswordValidatorError> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidatorError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidatorError.empty;
    } else if (value.length < 6) {
      return PasswordValidatorError.invalid;
    } else {
      return null;
    }
  }
  /// Tells validation error message for password
  static String? showPasswordErrorMessage(PasswordValidatorError? error) {
    if (error == PasswordValidatorError.empty) {
      return "Empty password";
    } else if (error == PasswordValidatorError.invalid) {
      return "Invalid password";
    } else {
      return null;
    }
  }
}
