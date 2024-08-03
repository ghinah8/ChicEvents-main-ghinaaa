part of 'home_bloc.dart';

class HomeState {
  final RequestStatus categoriesStatus;
  final List<CategoryModel> categories;
  final RequestStatus packagesStatus;
  final List<PackageModel> packages;
  HomeState({
    this.categoriesStatus = RequestStatus.init,
    this.categories = const [],
    this.packagesStatus = RequestStatus.init,
    this.packages = const [],
  });

  HomeState copyWith({
    RequestStatus? categoriesStatus,
    List<CategoryModel>? categories,
    RequestStatus? packagesStatus,
    List<PackageModel>? packages,
  }) {
    return HomeState(
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      categories: categories ?? this.categories,
      packagesStatus: packagesStatus ?? this.packagesStatus,
      packages: packages ?? this.packages,
    );
  }
}
