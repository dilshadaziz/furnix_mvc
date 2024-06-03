import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/models/address_model.dart';
import 'package:furnix_store/repositories/auth_repository.dart';
import 'package:furnix_store/repositories/user_repository.dart';

part 'address.event.dart';
part 'address.state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final UserRepository userRepository;
  final AuthRepository authRepository;
  AddressBloc({required this.authRepository, required this.userRepository})
      : super(AddressInitial()) {
    on<ChangeSelectedAddressRequested>(_onChangedSelectedAddressRequested);
    on<AddAddressRequested>(_onAddAddressRequested);
    on<FetchAddressRequested>(_onFetchAddressRequested);
    on<RemoveAddressRequested>(_onRemoveAddressRequested);
  }

  void _onChangedSelectedAddressRequested(
      ChangeSelectedAddressRequested event, Emitter<AddressState> emit) {
    emit(AddressChanged(index: event.index));
  }

  Future<void> _onAddAddressRequested(
      AddAddressRequested event, Emitter<AddressState> emit) async {
    emit(AddAddressLoading());

    try {
      // call the appropriate function to add the address to the firebase db
      await userRepository.addAddress(event.userId, {
        'address': event.address,
        'pincode': event.pincode,
        'name': event.name,
        'mobileNumber': event.mobileNumber
      });
      return emit(AddressAdded());
    } catch (_) {
      emit(AddAddressFailed());
    }
  }

  Future<void> _onFetchAddressRequested(
      FetchAddressRequested event, Emitter<AddressState> emit) async {
    final addresses = await userRepository.fetchAddress(event.userId);

    if (addresses != null) {
      return emit(AddressLoaded(addresses: addresses));
    }
    emit(FetchAddressError());
  }

  Future<void> _onRemoveAddressRequested(
      RemoveAddressRequested event, Emitter<AddressState> emit) async {
    try {
      await userRepository.removeAddress(
        event.index,authRepository.getCurrentUser()
      );
      emit(AddressRemovedSuccessfully());
    } catch (e) {}
  }
}
