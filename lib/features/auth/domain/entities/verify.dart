import 'package:equatable/equatable.dart';

class Verify extends Equatable {
  final List<int> roles;
  final String token;

  const Verify({required this.roles, required this.token});

  @override
  List<Object?> get props => [roles, token];
}
