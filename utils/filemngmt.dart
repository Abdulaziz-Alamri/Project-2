import 'dart:io';
import 'dart:convert';
import '../model/user/admin.dart';
import '../model/book.dart';
import '../model/user/customer.dart';
import '../model/user/user.dart';

readFile(List<Book>? books, List<User> users) async {
  File file = File('data/data.json');
  String content = file.readAsStringSync();
  Map<String, dynamic> bookList = jsonDecode(content);

  for (var book in bookList['library']) {
    books?.add(Book.fromJson(book));
  }

  file = File('data/users.json');
  content = file.readAsStringSync();
  Map<String, dynamic> userList = jsonDecode(content);

  for (var admin in userList['admin']) {
    users.add(Admin.fromJson(admin));
  }

  for (var customer in userList['customer']) {
    Customer c = Customer.fromJson(customer);
    users.add(c);
    Admin.customerList.add(c);
  }

  Book.sequence = (bookList['library'] as List).length+1;
  Customer.sequence = (userList['customer']as List).length +2;
}
