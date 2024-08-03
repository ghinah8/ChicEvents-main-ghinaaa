import 'package:bloc/bloc.dart';
import 'package:chic_events/core/firestore/status.dart';
import 'package:chic_events/core/models/product_model.dart';
import 'package:meta/meta.dart';

import '../../../core/firestore/firestore_database.dart';
import '../../../core/models/category_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<IndexCategories>((event, emit) async {
      emit(state.copyWith(categoriesStatus: RequestStatus.loading));
      final result = await FirestoreDatabase().getCategories();
      result.fold((l) {
        emit(state.copyWith(categoriesStatus: RequestStatus.failed));
      }, (r) {
        emit(state.copyWith(
            categoriesStatus: RequestStatus.success, categories: r));
      });
    });
    on<IndexPackages>((event, emit) async {
      emit(state.copyWith(packagesStatus: RequestStatus.loading));
      final result = await FirestoreDatabase().getProducts();
      result.fold((l) {
        emit(state.copyWith(packagesStatus: RequestStatus.failed));
      }, (r) {
        emit(
            state.copyWith(packagesStatus: RequestStatus.success, packages: r));
      });
    });
  }
}
