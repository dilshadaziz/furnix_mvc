part of 'bottom_nav.bloc.dart';

sealed class BottomNavState extends Equatable {
  const BottomNavState();

  @override
  List<Object> get props => [];
}

class BottomNavInitial extends BottomNavState {}

class BottomNavItemState extends BottomNavState {
  final int selectedIndex;

  const BottomNavItemState(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
