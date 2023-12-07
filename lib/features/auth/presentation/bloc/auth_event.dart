

// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';




@immutable
abstract class AuthEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {

  String email;
  int password;
  LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];

}

