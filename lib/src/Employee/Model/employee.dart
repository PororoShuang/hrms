import 'package:password/password.dart';

class Employee {
  late int id;
  late String name, role, address, email, phoneNo, hash;
  //cryptography to reduce vulnerabilities of brute-force attacks
  //increase security
  late PBKDF2 algorithm;

//encrypt data

  Employee(this.name, this.role, this.address, this.email, this.phoneNo,
      String password) {
    algorithm = new PBKDF2();
    hash = Password.hash(password, algorithm);
  }

  Employee.db(
      this.name, this.role, this.address, this.email, this.phoneNo, this.hash) {
    algorithm = new PBKDF2();
  }

  Employee.def() {
    id = 0;
    name = '';
    role = '';
    address = '';
    email = '';
    phoneNo = '';
    hash = '';
    algorithm = new PBKDF2();
  }

  bool passwordVerify(String password) {
    return Password.verify(password, hash);
  }
}
