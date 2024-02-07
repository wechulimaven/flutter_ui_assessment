import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_assessment/core/models/products_model.dart';
import 'package:flutter_assessment/core/repositories/product_repository.dart';

part 'product_state.dart';

class ProductsCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;

  ProductsCubit(this.productRepository) : super(ProductInitial());

  void getAllProducts() async {
    emit(LoadingProductState());
    try {
      var res = await productRepository.getAllProducts();
      Fimber.i('PRODS $res');
      emit(SuccessProductState(res, null));
    } catch (e) {
      Fimber.e("Product Exception $e");
      emit(ErrorProductState('$e'));
    }
  }

  void getFeaturedProducts() async {
    emit(LoadingProductState());
    try {
      var res = await productRepository.getFeaturedProducts();
      Fimber.i('PRODS $res');
      emit(SuccessProductState(null, res));
    } catch (e) {
      Fimber.e("Product Exception $e");
      emit(ErrorProductState('$e'));
    }
  }
}
