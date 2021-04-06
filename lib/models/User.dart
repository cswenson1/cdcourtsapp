class User {
  String name;
  String email;
  String phone;
  String dob;
  final String role = 'U';
  final String token;

  User({this.name, this.email, this.phone, this.dob, this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      dob: json['dob'],
    );
  }
}
