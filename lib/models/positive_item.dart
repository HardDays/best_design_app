import 'positive_affirmation.dart';

class PositiveItem {
  
  String id;

  String positiveAffirmationId;

  PositiveAffirmation positiveAffirmation;

  PositiveItem({this.id, this.positiveAffirmation, this.positiveAffirmationId});

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'positive_affirmation': positiveAffirmation.toJson(),
      'positive_affirmation_id': positiveAffirmation.id
    };
  }

  factory PositiveItem.fromJson(Map<String, dynamic> json) {
    return PositiveItem(
      id: json['id'],
      positiveAffirmationId: json['positive_affirmation_id'],
      positiveAffirmation: PositiveAffirmation.fromJson(json['positive_affirmation'])
    );
  }
}