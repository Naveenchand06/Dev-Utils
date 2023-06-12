import 'package:flutter/foundation.dart';

@immutable
class Strings {
  static const appName = 'Chatcord';
  static const loading = 'Loading...';
  static const welcomeToAppName = 'Welcome to ${Strings.appName}';
  static const enterYourSearchTermHere = 'Enter your search term here';

  static const dontHaveAnAccount = "Don't have an account?\n";
  static const signUpOn = 'Sign up on ';
  static const orCreateAnAccountOn = ' or create an account on ';

  static const person = 'person';
  static const people = 'people';
  static const ok = 'OK';

  static const delete = 'Delete';
  static const areYouSureYouWantToDeleteThis =
      'Are you sure you want to delete this';

  // log out
  static const logOut = 'Log out';
  static const areYouSureThatYouWantToLogOutOfTheApp =
      'Are you sure that you want to log out of the app?';
  static const cancel = 'Cancel';

  const Strings._();
}
