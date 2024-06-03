
part of 'user.bloc.dart';

sealed class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class FetchUser extends UserEvent {}


final class GetImageRequested extends UserEvent{}

final class EditProfileRequested extends UserEvent{

  final UserModel user;

  EditProfileRequested({required this.user});

  @override
  List<Object> get props => [user];


}

