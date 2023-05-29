import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/product.dart';

class FbFireStoreController {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  // ignore: non_constant_identifier_names
  Future<bool> Create({required Product product}) async {
    return await _instance
        .collection('product')
        .add(product.toMap())
        .then((DocumentReference value) => true)
        .catchError((error) => false);
  }

  Future<bool> delete({required String path}) async {
    return _instance
        .collection('product')
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  // ignore: non_constant_identifier_names
  Future<bool> Update({required Product product}) async {
    return _instance
        .collection('product')
        .doc(product.id)
        .update(product.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Stream<QuerySnapshot<Product>> read() async* {
    // yield* _instance.collection('Notes').snapshots();
    yield* _instance
        .collection('product')
        .withConverter<Product>(
          fromFirestore: (snapshot, options) =>
              Product.fromMap(snapshot.data()!),
          toFirestore: (Product product, options) => product.toMap(),
        )
        .snapshots();
  }
}
