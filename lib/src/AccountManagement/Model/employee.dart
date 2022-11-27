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
class User {
  static const String nameKey = "user_name";
  static const String arrayKey = "user_array";

  String? name;
  List? array;

  User({this.name, this.array});

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
        name: json[nameKey],
        array: json[arrayKey],
      );

  Map<String, dynamic> toJson() => {
        nameKey: name,
        arrayKey: array,
      };
}
