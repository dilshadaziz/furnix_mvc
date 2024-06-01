import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'address.event.dart';
part 'address.state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressInitial()) {
    on<ChangeSelectedAddressRequested>(_onChangedSelectedAddressRequested);
    on<AddAddressRequested>(_onAddAddressRequested);
  }

  void _onChangedSelectedAddressRequested(ChangeSelectedAddressRequested event, Emitter<AddressState> emit) {
    emit(AddressChanged(index: event.index
    ));
  }

  Future<void> _onAddAddressRequested(AddAddressRequested event, Emitter<AddressState> emit) async {
    emit(AddAddressLoading());

    // call the appropriate function to add the address to the firebase db

    emit(AddressAdded());
  }
}
