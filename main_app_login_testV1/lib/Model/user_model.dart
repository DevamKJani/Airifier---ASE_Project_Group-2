class UserModel {
  String? uid;
  String? email;
  String? name;
  String? number;

  UserModel({this.uid, this.email, this.name, this.number});

  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      number: map['number'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'number': number,
    };
  }
}
