part of 'bottom_nav.bloc.dart';

sealed class BottomNavEvent extends Equatable {
  const BottomNavEvent();

  @override
  List<Object> get props => [];
}

class BottomNavItemSelected extends BottomNavEvent {
  final int index;

  const BottomNavItemSelected(this.index);

  @override
  List<Object> get props => [index];
}
