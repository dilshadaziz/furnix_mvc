import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav.event.dart';
part 'bottom_nav.state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavInitial()) {
    on<BottomNavItemSelected>(_onItemSelected);
  }

  void _onItemSelected(BottomNavItemSelected event, Emitter<BottomNavState> emit) {
    emit(BottomNavItemState(event.index));
  }
}
