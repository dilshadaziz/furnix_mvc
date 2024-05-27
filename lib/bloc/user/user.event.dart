
part of 'user.bloc.dart';

@immutable
sealed class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class FetchUser extends UserEvent {}
