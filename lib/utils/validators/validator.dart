class BValidator {
  static String? validateEmptyText(String? fieldname, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldname is required';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
     final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(email)) {
      return 'Invalid email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if(!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }
    if(!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must conatin at least one number';
    }
    if(!value.contains(RegExp(r'[!@#$%^&*()<>?":{}|<>]'))) {
      return 'Password must conatin at least one Special character';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if(value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegExp = RegExp(r'^\d{11}$');
    if(!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (11 Digits required)';
    }
    return null;
  }
}
