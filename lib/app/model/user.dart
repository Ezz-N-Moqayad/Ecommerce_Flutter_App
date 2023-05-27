class User {
  late int id;
  late String firstName;
  late String lastName;
  late String email;
  late String phone;
  late String password;

  String _query = "";
  Map<String, dynamic> whereParams = <String, dynamic>{};

  User();

  ///Used to convert each row from map to object
  User.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    firstName = map['firstName'];
    lastName = map['lastName'];
    email = map['email'];
    phone = map['phone'];
    password = map['password'];
  }

  ///Used to convert object to map in order to be saved
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['password'] = password;
    return map;
  }
}