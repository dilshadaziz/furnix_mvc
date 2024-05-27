

String? formValidator({String? value,required String hintText,String? passwordController}) {
  if (value == null || value.isEmpty) {
    return '$hintText can\'t be empty';
  }
  if (hintText == 'Email address') {
    if (value.length <= 13 && !value.endsWith('@gmail.com') ) {
      return 'please enter valid $hintText';
    }
    if(value.length >= 14 && !value.endsWith('@gmail.com')){
      return 'please enter valid $hintText';
    }
    if(value.length < 14){
      return 'please enter valid $hintText';
    }
  }
  if (hintText == 'Password' ) {
    if (value.isEmpty) {
      return 'enter your password';
    }
    if (value.length < 6) {
      return 'Password can\'t be less than 6';
    }
  }

  if(hintText == 'Confirm Password'){
    if(passwordController != value){
      print(passwordController);
      print(value);
      return 'Confirm password doesn\'t match';
    }
  }

  return null;
}
