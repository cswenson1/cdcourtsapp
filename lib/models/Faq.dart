class Faq {
  int id;
  String faqQuestion;
  String faqAnswer;
  String status;
  bool isExpanded = false;

  Faq({this.id, this.faqQuestion, this.faqAnswer, this.status});

  factory Faq.fromJson(Map<String, dynamic> json) {
    return Faq(
      id: json['id'],
      faqQuestion: json['faq_question'],
      faqAnswer: json['faq_answer'],
      status: json['status']
    );
  }
}
