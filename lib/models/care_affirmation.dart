class CareAffirmation {

  String id;
  String title;

  int month;

  CareAffirmation({this.id, this.title, this.month});

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'title': title,
      'month': month
    };
  }

  factory CareAffirmation.fromJson(Map<String, dynamic> json) {
    return CareAffirmation(
      id: json['id'],
      title: json['title'],
      month: json['month'],
    );
  }
}