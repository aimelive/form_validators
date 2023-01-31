import 'package:form_validators/form_validators.dart';

/// Tells email validation error type
enum EmailValidatorError { empty, invalid }

const String _kEmailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

class Email extends FormzInput<String, EmailValidatorError> {
  const Email.pure() : super.pure('');
  const Email.dirty([String value = '']) : super.dirty(value);

  static final _regex = RegExp(_kEmailPattern);

  @override
  EmailValidatorError? validator(String value) {
    if (_regex.hasMatch(value)) {
      return null;
    } else if (value.isEmpty) {
      return EmailValidatorError.empty;
    } else {
      return EmailValidatorError.invalid;
    }
  }
  /// Tells validation error message for email
  static String? showEmailErrorMessage(EmailValidatorError? error) {
    if (error == EmailValidatorError.empty) {
      return "Empty email";
    } else if (error == EmailValidatorError.invalid) {
      return "Invalid email";
    } else {
      return null;
    }
  }
}
