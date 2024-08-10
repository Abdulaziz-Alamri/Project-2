import 'dart:io';
import 'dart:convert';
import '../model/admin.dart';
import '../model/book.dart';
import '../model/customer.dart';
import '../model/user.dart';

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
    users.add(Customer.fromJson(customer));
  }
}