part of 'vendors_bloc.dart';

@immutable
abstract class VendorsEvent {}

class IndexVendorsEvent extends VendorsEvent {}

class IndexProductsByCategory extends VendorsEvent {
  final String categoryId;
  IndexProductsByCategory({
    required this.categoryId,
  });
}
