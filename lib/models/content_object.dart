import '../constants/constants.dart';

class ContentObject {
  int? id;
  String name;
  String body;
  String? photo;

  ContentObject({this.id, required this.name, required this.body, this.photo});

  Map<String, dynamic> toMap() {
    return {columnId: id, contentName: name, contentBody: body, contentPhoto: photo};
  }

  factory ContentObject.fromMap(Map<String, dynamic> map) {
    return ContentObject(id: map['id'], name: map['name'], body: map['body'], photo: map['photo']);
  }
}
