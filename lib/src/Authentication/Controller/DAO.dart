import 'package:hrms/src/Authentication/Model/employee.dart';

import '../Model/mysql.dart';

/// DAO == Data Access Object
/// Here we got the connection between the app and the database
class DAO {
  Mysql db = new Mysql();

  DAO();

  Future<List<Employee>> getCustomers() async {
    List<Employee> result = [];
    db.getConnection().then((conn) {
      String sql = 'select * from hrms.employee;';
      conn.query(sql).then((results) {
        for (var row in results) {
          result.add(
              new Employee.db(row[0], row[1], row[2], row[3], row[4], row[5]));
        }
      }, onError: (error) {
        print('$error');
      }).whenComplete(() {
        conn.close();
      });
    });
    return result;
  }

  Future<void> insertEmployee(Employee employee) async {
    db.getConnection().then((conn) {
      String sql =
          'insert into hrms.employee (name, role, address, email, phoneNo, password) values(?, ?, ?, ?, ?, ?)';
      conn.query(sql, [
        employee.name,
        employee.role,
        employee.address,
        employee.email,
        employee.phoneNo,
        employee.hash
      ]).then((results) {
        print('Inserted Employee Data Succesfullly');
      }, onError: (error) {
        print('$error');
      }).whenComplete(() {
        conn.close();
      });
    });
  }
}
