class UserModel {
  String? name;
  String? email;
  String? userId;

  UserModel({this.name, this.email, this.userId});

  UserModel.fromJson(Map<dynamic, dynamic>? map) {
    if (map == null)
      return;
    else {
      userId = map['userId'];
      name = map['name'];
      email = map['email'];
    }
  }

  toJson() {
    return {'email': email, 'name': name, 'userId': userId};
  }
}
