class Location {
  int id;
  String name;
  String address;
  String phone;
  String fax;
  String googleLink;
  String status;

  Location(
      {this.id,
      this.name,
      this.address,
      this.phone,
      this.fax,
      this.googleLink,
      this.status});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
        id: json['id'],
        name: json['name'],
        address: json['address'],
        phone: json['phone'],
        fax: json['fax'],
        googleLink: json['google_link'],
        status: json['status']);
  }
}
