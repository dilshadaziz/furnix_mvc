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

final class AddressLoaded extends AddressState {
  final List<AddressModel> addresses;
  const AddressLoaded({required this.addresses});
  @override
  List<Object> get props => [addresses];
}

final class AddAddressLoading extends AddressState {}

final class AddAddressFailed extends AddressState {}

final class FetchAddressError extends AddressState {}

final class AddressRemovedSuccessfully extends AddressState {}
