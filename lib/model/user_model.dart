// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  String? uid;
  String? email;
  String? phone;
  String? firstName;
  String? lastName;

  UserModel({this.uid, this.email, this.phone, this.firstName, this.lastName});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      phone: map['phone'],
      firstName: map['firstName'],
      lastName: map['lastName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'phone': phone,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
