import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;

  LoginEvent(this.email);

  @override
  List<Object> get props => [email];
}

class VerifyEvent extends AuthEvent {
  final String email;
  final String otp;

  VerifyEvent({required this.email, required this.otp});

  @override
  List<Object> get props => [email];
}
