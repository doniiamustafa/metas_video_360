class Validator {
  static String emptyUserName = 'username can\'t be empty';
  static String shortUserName = 'username should be longer than 7 characters';
  static String emptyProficiency = 'proficiency can\'t be empty';
  static String wrongProficiency =
      'proficiency should be engineer, student or graduate';
  static String emptyPhoneNumber = 'phone number can\'t be empty';
  static String wrongPhoneNumberFormat = 'phone number must be numeric';
  static String shortPhoneNumber = 'phone number must be longer than that';
  static String longPhoneNumber = 'very long phone number';

  static bool isValidPhoneNumber(String value) {
    String pattern = r'^(?:[+0][1-9])?[0-9]{5,16}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty || !regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool _isNumeric(String str) {
    if (str.isEmpty) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  static String? validatePhone(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyPhoneNumber;
      }
      if (!_isNumeric(value)) {
        return wrongPhoneNumberFormat;
      }
      if (value.length < 11) {
        return shortPhoneNumber;
      }

      if (value.length > 25) {
        return longPhoneNumber;
      }
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyUserName;
      }
      if (value.length < 4) {
        return shortUserName;
      }
    }
    return null;
  }

  static String? validateProficiency(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return emptyProficiency;
      } else {
        return null;
      
      }
    } else {
      return emptyProficiency;
    }
  }
}
