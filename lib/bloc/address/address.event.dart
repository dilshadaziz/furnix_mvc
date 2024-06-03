
part of 'address.bloc.dart';

sealed class AddressEvent extends Equatable{
  const AddressEvent();

  @override
  List<Object> get props => [];
}



class AddAddressRequested extends AddressEvent {
  final String name;
  final String mobileNumber;
  final String address;
  final String pincode;
  final String userId;

  const AddAddressRequested({
    required this.name,
    required this.mobileNumber,
    required this.address,
    required this.pincode,
    required this.userId, 
  });

  @override
  List<Object> get props => [name,mobileNumber,address,pincode,userId,];
}

class ChangeSelectedAddressRequested extends AddressEvent{
  final int index;

 const ChangeSelectedAddressRequested({required this.index});
}


final class FetchAddressRequested extends AddressEvent{
  final String userId;

  const FetchAddressRequested({required this.userId});
}

final class RemoveAddressRequested extends AddressEvent{
  final int index;
  const RemoveAddressRequested({ required this.index});
}
