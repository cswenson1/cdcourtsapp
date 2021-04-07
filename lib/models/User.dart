class User {
  String name;
  String email;
  String phone;
  String dob;
  final String role = 'U';
  final String token;
  Map<String, dynamic> probationOfficer;
  Map<String, dynamic> office;
  Map<String, dynamic> color;

  User({
    this.name,
    this.email,
    this.phone,
    this.dob,
    this.token,
    this.probationOfficer,
    this.office,
    this.color,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      dob: json['dob'],
      probationOfficer: json['probation_officer'],
      office: json['office'],
      color: json['color'],
    );
  }
}
