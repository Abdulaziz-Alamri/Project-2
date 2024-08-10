import 'user.dart';
import 'customer.dart';
import '../../bin/library_system.dart';

class Admin extends User {
  static List<Customer> customerList = [];
  Admin(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.password});

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        password: json['password']);
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'password': password
    };
  }

  static displayAllCustomers() {
    print(color('\n--- Customers of Library ---\n'));
    for (var customer in customerList) {
      print(blue('Customer ID: ${customer.id}'));
      print(blue('Customer Name: ${customer.firstName} ${customer.lastName}'));
      print(blue('Books Bought:'));
      if(customer.purchaseHistory.isEmpty){
        print(('No Books purchased'));
      }
      for (var book in customer.purchaseHistory) {
        print(gold(book.toJson()));
      }
      print('');
    }
  }
}