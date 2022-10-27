class UserModel {
  late String userId, email, name, picture;

  UserModel(this.userId, this.email, this.name, this.picture);

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    picture = map['picture'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'picture':picture,
    };
  }
}