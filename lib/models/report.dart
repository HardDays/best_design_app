class Report {

  String id;
  String subject;
  String email;
  String message;

  Report({
    this.id, 
    this.email, 
    this.subject, 
    this.message
  });

  Map <String, dynamic> toJson() {
    Map <String, dynamic> res = {
      'id': id,
      'email': email,
      'subject': subject,
      'message': message,
    };
    return res;
  }
}