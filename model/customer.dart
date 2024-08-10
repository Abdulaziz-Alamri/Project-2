import 'user.dart';
import 'book.dart';
import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../utils/updateuser.dart';
import 'admin.dart';

class Customer extends User {
  List<Book> purchaseHistory = [];
  static int sequence = 2;

  Customer(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.password,
      required this.purchaseHistory}){
        sequence++;
        Admin.customerList.add(this);
      }

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        password: json['password'],
        purchaseHistory: json['purchaseHistory']?? []);
  }

  Map<String,dynamic> toJson(){
    return {
      'id': id,
      'firstName':firstName,
      'lastName':lastName,
      'password':password,
      'books_bought':purchaseHistory.map((purchase) => purchase.toJson()).toList()
    };
  }

  static addNewCustomer() {
    print('Fill in the following information\n');
    String id = '$sequence';
    stdout.write('First Name: ');
    String firstName = stdin.readLineSync()!;
    stdout.write('Last Name: ');
    String lastName = stdin.readLineSync()!;
    String password = setPassword();

    Customer customer = Customer(
        id: id,
        firstName: firstName,
        lastName: lastName,
        password: password,
        purchaseHistory: []);
    updateUser(customer);
  }

  static String setPassword() {
    stdout.write('\nEnter password: ');
    String password = stdin.readLineSync()!;
    String hashedPassword = sha256.convert(utf8.encode(password)).toString();
    return hashedPassword;
  }
}