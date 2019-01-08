class Address {
  String street, city, zipcode;

  Address(this.street, this.city, this.zipcode);

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    zipcode = json['zipcode'];
  }
}
