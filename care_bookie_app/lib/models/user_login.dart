class UserLogin {
  final String id;
  final String firstName;
  final String lastName;
  final String birthDay;
  final String email;
  final int gender;
  final String phone;
  final String address;
  final String image;

  UserLogin(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.birthDay,
      required this.email,
      required this.gender,
      required this.phone,
      required this.address,
      required this.image});

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
        id: json['userId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        birthDay: json['birthDay'],
        email: json['email'],
        gender: json['gender'],
        phone: json['phone'],
        address: json['address'],
        image: json['imageUrl']);
  }
}
