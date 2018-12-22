class BucketIdea {

  String id;
  String title;

  BucketIdea({this.id, this.title});

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'title': title,
    };
  }

  factory BucketIdea.fromJson(Map<String, dynamic> json) {
    return BucketIdea(
      id: json['id'],
      title: json['title'],
    );
  }
}