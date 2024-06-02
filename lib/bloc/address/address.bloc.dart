import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnix_store/models/address_model.dart';
import 'package:furnix_store/repositories/user_repository.dart';
import 'package:furnix_store/services/user/firebase_user.service.dart';

part 'address.event.dart';
part 'address.state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final UserRepository userRepository;
  AddressBloc({required this.userRepository}) : super(AddressInitial()) {
    on<ChangeSelectedAddressRequested>(_onChangedSelectedAddressRequested);
    on<AddAddressRequested>(_onAddAddressRequested);
    on<FetchAddressRequested>(_onFetchAddressRequested);
  }

  void _onChangedSelectedAddressRequested(
      ChangeSelectedAddressRequested event, Emitter<AddressState> emit) {
    emit(AddressChanged(index: event.index));
  }

  Future<void> _onAddAddressRequested(
      AddAddressRequested event, Emitter<AddressState> emit) async {
    emit(AddAddressLoading());

    try{
      // call the appropriate function to add the address to the firebase db
    await userRepository.addAddress(event.userId, {
      'address': event.address,
      'pincode': event.pincode,
      'name': event.fullName,
      'mobileNumber': event.mobileNumber
    });
    } catch(_){
      emit(AddAddressFailed());
    }

    emit(AddressAdded());
  }

  Future<void> _onFetchAddressRequested(FetchAddressRequested event,Emitter<AddressState> emit) async{
    
    final addresses = await userRepository.fetchAddress(event.userId);

    if(addresses!= null){
     return emit(AddressLoaded(addresses: addresses));
    }
    emit(FetchAddressError());
  }
}
