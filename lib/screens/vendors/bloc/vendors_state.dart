part of 'vendors_bloc.dart';

class VendorsState {
  final RequestStatus indexStatus;
  final RequestStatus indexProductsStatus;
  final List<CategoryModel> categories;
  final List<PackageModel> products;
  VendorsState({
    this.indexStatus = RequestStatus.init,
    this.indexProductsStatus = RequestStatus.init,
    this.categories = const [],
    this.products = const [],
  });

  VendorsState copyWith({
    RequestStatus? indexStatus,
    RequestStatus? indexProductsStatus,
    List<CategoryModel>? categories,
    List<PackageModel>? products,
  }) {
    return VendorsState(
      indexProductsStatus: indexProductsStatus ?? this.indexProductsStatus,
      indexStatus: indexStatus ?? this.indexStatus,
      categories: categories ?? this.categories,
      products: products ?? this.products,
    );
  }
}
