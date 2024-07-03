part of 'order_bloc.dart';

sealed class OrderState extends Equatable {
  const OrderState();
  
  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState {}
final class OrderAddedToCart extends OrderState{}
final class OrderAddToCartLoading extends OrderState{}

