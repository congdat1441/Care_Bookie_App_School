class UserLogin {
  final String id;
  late final String firstName;
  final String lastName;
  late final String birthDay;
  late final String email;
  late final int gender;
  late final String phone;
  late final String address;
  final String image;
  String? password;

  UserLogin(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.birthDay,
      required this.email,
      required this.gender,
      required this.phone,
      required this.address,
      required this.image,
      this.password
      });

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

  @override
  String toString() {
    return 'UserLogin{id: $id, firstName: $firstName, lastName: $lastName, birthDay: $birthDay, email: $email, gender: $gender, phone: $phone, address: $address, image: $image, password: $password}';
  }

}
