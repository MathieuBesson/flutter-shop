class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String phone;
  final String email;
  final String address;
  final String postalCode;
  final String city;
  final String image;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phone,
    required this.email,
    required this.postalCode,
    required this.city,
    required this.address,
    required this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      phone: json['phone'],
      email: json['email'],
      address: json['address']['address'],
      postalCode: json['address']['postalCode'],
      city: json['address']['city'],
      image: json['image'],
    );
  }
}
