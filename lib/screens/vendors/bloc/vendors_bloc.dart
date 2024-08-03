import 'package:bloc/bloc.dart';
import 'package:chic_events/core/firestore/status.dart';
import 'package:chic_events/core/models/product_model.dart';
import 'package:meta/meta.dart';

import '../../../core/firestore/firestore_database.dart';
import '../../../core/models/category_model.dart';

part 'vendors_event.dart';
part 'vendors_state.dart';

class VendorsBloc extends Bloc<VendorsEvent, VendorsState> {
  VendorsBloc() : super(VendorsState()) {
    on<IndexVendorsEvent>((event, emit) async {
      emit(state.copyWith(indexStatus: RequestStatus.loading));
      final result = await FirestoreDatabase().getCategories();
      result.fold((l) {
        emit(state.copyWith(indexStatus: RequestStatus.failed));
      }, (r) {
        emit(state.copyWith(indexStatus: RequestStatus.success, categories: r));
      });
    });
    on<IndexProductsByCategory>((event, emit) async {
      emit(state.copyWith(indexProductsStatus: RequestStatus.loading));
      final result =
          await FirestoreDatabase().getProductsByCategory(event.categoryId);
      result.fold((l) {
        emit(state.copyWith(indexProductsStatus: RequestStatus.failed));
      }, (r) {
        emit(state.copyWith(
            indexProductsStatus: RequestStatus.success, products: r));
      });
    });
  }
}
