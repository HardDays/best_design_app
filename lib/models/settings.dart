class Settings {

  DateTime lastMonthlyDate;

  Settings({this.lastMonthlyDate});

  Map<String, dynamic> toJson(){
    return {
      'last_monthly_date': lastMonthlyDate?.toString(),
    };
  }

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      lastMonthlyDate: json['last_monthly_date'] != 'null' && json['last_monthly_date'] != null ? DateTime.parse(json['last_monthly_date']) : null,
    );
  }
}