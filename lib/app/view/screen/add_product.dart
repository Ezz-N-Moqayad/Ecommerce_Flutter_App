import 'package:flutter/material.dart';
import '../../firebase/fb_fire_store_controller.dart';
import '../../model/product.dart';
import '../../utils/helpers.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key, this.product}) : super(key: key);
  final Product? product;

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> with Helpers {
  late TextEditingController _titleTextController;
  late TextEditingController _priceController;

  @override
  void initState() {
    super.initState();
    _titleTextController = TextEditingController(text: widget.product?.title);
    _priceController = TextEditingController(text: widget.product?.price);
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 30, end: 30),
            child: TextField(
              controller: _titleTextController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabled: true,
                hintText: 'Name',
                filled: true,
                fillColor: const Color(0xffFFFFFF),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                constraints: const BoxConstraints(
                  maxWidth: 400,
                  maxHeight: 60,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xff6A90F2),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 30, end: 30),
            child: TextField(
              controller: _priceController,
              keyboardType: TextInputType.text,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabled: true,
                hintText: 'Price',
                filled: true,
                fillColor: const Color(0xffFFFFFF),
                hintStyle: const TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                constraints: const BoxConstraints(
                  maxWidth: 400,
                  maxHeight: 60,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xff6A90F2),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async => await _performSave(),
            // ignore: sort_child_properties_last
            child: const Text('SAVE'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(328, 60),
            ),
          ),
        ],
      ),
    );
  }

  String getScreenTitle() => isNewNote() ? 'Create Note' : 'Update Note';

  Future<void> _performSave() async {
    if (checkData()) {
      await _save();
    }
  }

  bool checkData() {
    if (_titleTextController.text.isNotEmpty &&
        _priceController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(context, message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _save() async {
    bool status = isNewNote()
        ? await FbFireStoreController().Create(product: product)
        : await FbFireStoreController().Update(product: product);

    String message = status ? 'Note saved successfully' : 'Note save failed!';
    // ignore: use_build_context_synchronously
    showSnackBar(context, message: message, error: !status);
    if (isNewNote()) {
      _clear();
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    }
  }

  void _clear() {
    _titleTextController.text = '';
    _priceController.text = '';
  }

  Product get product {
    Product product = isNewNote() ? Product() : widget.product!;
    product.title = _titleTextController.text;
    product.price = _priceController.text;
    return product;
  }

  bool isNewNote() => widget.product == null;
}
