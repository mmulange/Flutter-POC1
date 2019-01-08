import 'package:first_project/model/Address.dart';

///User model to manage register user and jsonplaceholder users API data.
class User {
  static final String tableUser = "user";
  static final String columnId = "id";
  static final String columnFirstName = "firstName";
  static final String columnLastName = "lastName";
  static final String columnPhone = "phone";
  static final String columnEmail = "email";
  static final String columnAddress = "address";
  static final String columnPassword = "password";
  static final String columnGender = "gender";

  String firstName, lastName, phone, email, address, password, gender, website;
  int id;
  Address address1;

  User(this.firstName, this.lastName, this.phone, this.email, this.address,
      this.password, this.gender);

  User.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    firstName = map[columnFirstName];
    lastName = map[columnLastName];
    phone = map[columnPhone];
    email = map[columnEmail];
    address = map[columnAddress];
    password = map[columnPassword];
    gender = map[columnGender];
  }

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['name'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
    address1 = Address.fromJson(json['address']);
  }

  Map<String, dynamic> toMap() {
    return {
      columnId: id,
      columnFirstName: firstName,
      columnLastName: lastName,
      columnPhone: phone,
      columnEmail: email,
      columnAddress: address,
      columnGender: gender
    };
  }
}
