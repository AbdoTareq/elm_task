import 'package:elm_task/features/auth/domain/entities/verify.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthEmpty extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

class LoginSuccess extends AuthState {
  final bool success;

  LoginSuccess({required this.success});

  @override
  List<Object> get props => [success];
}

class VerifySuccess extends AuthState {
  final Verify success;

  VerifySuccess({required this.success});

  @override
  List<Object> get props => [success];
}
