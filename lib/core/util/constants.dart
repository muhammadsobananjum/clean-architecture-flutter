// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const SERVER_FAILURE = 'Server Error';
const AUTH_FAILURE = 'Invalid username or password';
const SUCCESS = 'Success';

const appButtonScaleAnimationDurationGlobal = 40;
const defaultButtonHeight = 50.0;


class AppConstants {

  static const login = 'Login';
  static const dashboard = 'Dashboard';
  static const invalid_email_address = 'Invalid email address';
  static const hint_email = 'test@gmail.com';
  static const hint_password = '* * * * *';
  static const password_length_greater_than_6 = 'Password length must be greater than 6';
  static const logout = 'Logout';
  static const cancel = 'Cancel';
  static const are_you_sure_to_logout = 'Are you sure you want to logout?';

}

class AppImages{
  static const splash_logo = 'assets/icons/login.svg';
  static const main_top = 'assets/images/main_top.png';
  static const login_bottom = 'assets/images/login_bottom.png';
}




final kPrimaryColor = const Color(0xFF6F35A5).withOpacity(0.7);
const kPrimaryLightColor = Color(0xFFF1E6FF);

const double defaultPadding = 16.0;