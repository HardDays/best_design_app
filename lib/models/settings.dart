class Settings {

  bool playSound;
  bool dailyReminders;

  DateTime morningTime;
  DateTime afternoonTime;
  DateTime eveningTime;

  DateTime lastMonthlyDate;

  Settings({this.lastMonthlyDate, this.playSound, this.dailyReminders, this.morningTime, this.afternoonTime, this.eveningTime});

  Map<String, dynamic> toJson(){
    return {
      'last_monthly_date': lastMonthlyDate?.toString(),
      'daily_reminders': dailyReminders?.toString(),     
      'play_sound': playSound?.toString(),
      'morning_time': morningTime?.toString(),
      'afternoon_time': afternoonTime?.toString(),
      'evening_time': eveningTime?.toString()
    };
  }

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      playSound: json['play_sound'] == 'true',
      dailyReminders: json['daily_reminders'] == 'true',
      lastMonthlyDate: json['last_monthly_date'] != 'null' && json['last_monthly_date'] != null ? DateTime.parse(json['last_monthly_date']) : DateTime.now().subtract(Duration(days: 3)),
      morningTime: json['morning_time'] != 'null' && json['morning_time'] != null ? DateTime.parse(json['morning_time']) : DateTime(1980, 1, 1, 10, 0),
      afternoonTime: json['afternoon_time'] != 'null' && json['afternoon_time'] != null ? DateTime.parse(json['afternoon_time']) : DateTime(1980, 1, 1, 12, 0),
      eveningTime: json['evening_time'] != 'null' && json['evening_time'] != null ? DateTime.parse(json['evening_time']) : DateTime(1980, 1, 1, 16, 0),
    );
  }
}