part of 'user.bloc.dart';

sealed class UserState extends Equatable {
  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserLoaded extends UserState {
  final UserModel user;

  UserLoaded({required this.user});

  @override
  List<Object> get props => [user];
}

final class UserError extends UserState {
  final String message;

  UserError({required this.message});

  @override
  List<Object> get props => [message];
}

final class EditProfileLoading extends UserState {}

final class EditProfileSuccess extends UserState {}
