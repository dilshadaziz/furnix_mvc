part of 'order_bloc.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class AddToCartRequested extends OrderEvent{
  final ProductsModel product;

  const AddToCartRequested({required this.product});

  @override
  List<Object> get props =>[product];
}
class DeleteFromCartRequested extends OrderEvent{}

