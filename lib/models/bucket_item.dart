import 'bucket_idea.dart';

class BucketItem {

  String id;

  String title;
  String bucketIdeaId;

  BucketIdea bucketIdea;
  
  BucketItem({this.id, this.title, this.bucketIdea, this.bucketIdeaId});

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'title': title,
      'bucket_idea': bucketIdea,
      'bucket_idea_id': bucketIdea?.id
    };
  }

  factory BucketItem.fromJson(Map<String, dynamic> json) {
    return BucketItem(
      id: json['id'],
      title: json['title'],
      bucketIdeaId: json['bucket_idea_id'],
      bucketIdea: json['bucket_idea'] != null ? BucketIdea.fromJson(json['bucket_idea']) : null
    );
  }
}