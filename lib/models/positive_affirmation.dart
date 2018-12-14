class PositiveCategory {
  static const String love = 'love';
  static const String healthAndBeauty = 'health_and_beauty';
  static const String abundance = 'abundance';
  static const String personal = 'personal';
}

class PositiveAffirmation {

  String id;
  String title;

  String category;

  PositiveAffirmation({this.id, this.title, this.category});

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'title': title,
      'category': category
    };
  }

  factory PositiveAffirmation.fromJson(Map<String, dynamic> json) {
    return PositiveAffirmation(
      id: json['id'],
      title: json['title'],
      category: json['category'],
    );
  }
}