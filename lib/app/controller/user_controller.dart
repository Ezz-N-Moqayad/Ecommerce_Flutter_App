
import 'package:e_commerce_app/app/builder/query_builder.dart';
import 'package:e_commerce_app/app/storage/shared_prefrenses_controller.dart';

class UserController {

  Future<bool> login(String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      Map<String, dynamic>? row = await QueryBuilder()
          .setTableName("users")
          .where('email', email)
          .and()
          .where('password', password)
          .first();
      if(row != null) {
        await SharedPrefController().setLogin(true);
      }
      return row != null;
    }
    return false;
  }

  bool checkData() {
    return false;
  }

  Future<bool> save(String firstName, String lastName, String email, String phone, String password) async {
    if (firstName.isNotEmpty && lastName.isNotEmpty && email.isNotEmpty && phone.isNotEmpty && password.isNotEmpty) {
      int newRowId = await QueryBuilder()
          .setTableName('users')
          .insert('firstName', firstName)
          .insert("lastName", lastName)
          .insert('email', email)
          .insert('phone', phone)
          .insert('password', password)
          .save();
      return newRowId != 0;
    }
    return false;
  }
}