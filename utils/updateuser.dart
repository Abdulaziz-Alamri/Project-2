import 'dart:io';
import 'dart:convert';
import '../model/book.dart';
import '../model/user/user.dart';
import '../model/user/admin.dart';

updateUser(User user, {Book? book}) async {
  File file = File('data/users.json');
  String content = file.readAsStringSync();
  Map<String, dynamic> users = jsonDecode(content);

  if (book != null) {
    for (var customer in users['customer']) {
      if (customer['id'] == user.id) {
        (customer['books_bought'] as List).add(book.displayBookBought(book));
        for (var object in Admin.customerList) {
          if (object.id == customer['id']) {
            object.purchaseHistory.add(book);
            break;
          }
        }
        break;
      }
    }
  } else {
    (users['customer'] as List).add(user.toJson());
  }

  String update = jsonEncode(users);
  file.writeAsStringSync(update, mode: FileMode.write);
}
