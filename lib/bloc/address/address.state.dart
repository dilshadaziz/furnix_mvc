part of 'address.bloc.dart';

sealed class AddressState extends Equatable {
  const AddressState();

  @override
  List<Object> get props => [];
}

final class AddressInitial extends AddressState {}

final class AddressAdded extends AddressState {}

final class AddressChanged extends AddressState {
 final int index;

  const AddressChanged({required this.index});

  
  @override
  List<Object> get props => [index];
}

final class AddressLoaded extends AddressState {}

final class AddAddressLoading extends AddressState {}
