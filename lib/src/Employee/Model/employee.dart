// class Employee {
//   late int id;
//   late String name, role, address, email, phoneNo, password;

//   Employee(this.name, this.role, this.address, this.email, this.phoneNo,
//       String password) {}

//   Employee.db(this.name, this.role, this.address, this.email, this.phoneNo,
//       this.password) {}

//   Employee.def() {
//     id = 0;
//     name = '';
//     role = '';
//     address = '';
//     email = '';
//     phoneNo = '';
//     password = '';
//   }
// }

import 'dart:convert';

class User {
  String user;
  String password;
  List modelData;

  User({
    required this.user,
    required this.password,
    required this.modelData,
  });

  static User fromMap(Map<String, dynamic> user) {
    return new User(
      user: user['user'],
      password: user['password'],
      modelData: jsonDecode(user['model_data']),
    );
  }

  toMap() {
    return {
      'user': user,
      'password': password,
      'model_data': jsonEncode(modelData),
    };
  }
}
