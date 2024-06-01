
part of 'address.bloc.dart';

sealed class AddressEvent extends Equatable{
  const AddressEvent();

  @override
  List<Object> get props => [];
}



class AddAddressRequested extends AddressEvent {
  final String fullName;
  final String mobileNumber;
  final String address;
  final String pincode;

  const AddAddressRequested({
    required this.fullName,
    required this.mobileNumber,
    required this.address,
    required this.pincode,
  });

  @override
  List<Object> get props => [];
}

class ChangeSelectedAddressRequested extends AddressEvent{
  final int index;

 const ChangeSelectedAddressRequested({required this.index});
}


final class FetchAddressRequested extends AddressEvent{}
