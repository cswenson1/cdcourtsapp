class Document {
  int id;
  String name;
  String status;
  String downloadLink;

  Document({this.id, this.name, this.status, this.downloadLink});

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        downloadLink: json['upload_link']);
  }
}
