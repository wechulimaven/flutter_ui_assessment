part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class LoadingProductState extends ProductState {}

class ErrorProductState extends ProductState {
  final String message;

  const ErrorProductState(this.message);
}

class SuccessProductState extends ProductState {
  final List<Product>? allProductsList;
  final List<Product>? featuredProductsList;

  const SuccessProductState(this.allProductsList, this.featuredProductsList);
}
