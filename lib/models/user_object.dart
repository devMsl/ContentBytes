import '../constants/constants.dart';

class UserObject {
  int? id;
  String contact;
  String password;

  UserObject({this.id, required this.contact, required this.password});

  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      userContact: contact,
      userPassword: password,
    };
  }

  factory UserObject.fromMap(Map<String, dynamic> map) {
    return UserObject(
      id: map['id'],
      contact: map['contact'],
      password: map['password'],
    );
  }
}
