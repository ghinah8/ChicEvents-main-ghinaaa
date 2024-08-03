import 'package:chic_events/core/firestore/handling_error.dart';
import 'package:chic_events/core/models/category_model.dart';
import 'package:chic_events/core/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class FirestoreDatabase with HandlingError {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<Either<String, List<CategoryModel>>> getCategories() async {
    return handleError(tryCall: () async {
      final result = await db.collection('categories').get();
      final List<CategoryModel> list =
          List<CategoryModel>.generate(result.docs.length, (index) {
        return CategoryModel.fromFirestore(result.docs[index]);
      });
      return Right(list);
    });
  }

  Future<Either<String, List<PackageModel>>> getProducts() async {
    return handleError(tryCall: () async {
      final result = await db.collection('packages').get();
      final DocumentReference<Map<String, dynamic>> categoryS =
          result.docs.first.data()['category'];
      final DocumentSnapshot<Map<String, dynamic>> category =
          await categoryS.get();
      final List<PackageModel> list =
          List<PackageModel>.generate(result.docs.length, (index) {
        return PackageModel.fromFirestore(result.docs[index], category);
      });
      return Right(list);
    });
  }

  Future<Either<String, List<PackageModel>>> getProductsByCategory(
      String categoryId) async {
    return handleError(tryCall: () async {
      print(categoryId);
      final result = await db
          .collection('packages')
          .where('category',
              isEqualTo:
                  (await db.collection('categories').doc(categoryId).get())
                      .reference)
          .get();
      if (result.docs.isNotEmpty) {
        final DocumentReference<Map<String, dynamic>> categoryS =
            result.docs.first.data()['category'];

        final DocumentSnapshot<Map<String, dynamic>> category =
            await categoryS.get();
        final List<PackageModel> list =
            List<PackageModel>.generate(result.docs.length, (index) {
          return PackageModel.fromFirestore(result.docs[index], category);
        });
        return Right(list);
      } else {
        return const Right([]);
      }
    });
  }
}
