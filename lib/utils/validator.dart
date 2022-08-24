class Validation {
  // regular expression for email and phone
  static String? emailPhone(String value) {
    RegExp regexPhone = RegExp(r'^[0-9]*$');
    if (value.isEmpty) {
      return 'Please enter some text';
    } else if (value.trim().contains(" ")) {
      return 'Blank space is not allowed';
    } else if (!regexPhone.hasMatch(value)) {
      RegExp regexMail = RegExp(r'[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
      if (!regexMail.hasMatch(value)) {
        return 'Enter valid Email or Phone Number';
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  //  regular expression for image url
  static String? url(String value) {
    if (Uri.parse(value).isAbsolute) {
      String extension = Uri.parse(value).path.split(".")[1];
      RegExp regexPhone = RegExp(r'(jpg|jpeg|png|webp|avif|gif|svg)');
      if (!regexPhone.hasMatch(extension)) {
        return 'Enter Valid URL';
      }
    } else {
      return 'Enter Valid URL';
    }
    return null;
  }
}
