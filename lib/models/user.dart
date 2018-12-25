class User {

  String id;
  String email;
  String password;
  String oldPassword;
  String passwordConfirmation;
  String firstName;
  String lastName;
  String token;
  String phone;
  String base64;
  String imageId;

  User({
    this.id, 
    this.email, 
    this.token, 
    this.password, 
    this.passwordConfirmation, 
    this.firstName, 
    this.lastName,
    this.phone,
    this.base64,
    this.imageId
  });

  Map <String, dynamic> toJson() {
    Map <String, dynamic> res = {
      'id': id,
      'token': token,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'image_id': imageId,
    };
    if (base64 != null){
      res['image'] = {
        'base64': base64
      };
    }
    return res;
  }

  Map <String, dynamic> toUpdateJson() {
    var current = toJson();
    var res = Map <String, dynamic>();

    for (var key in current.keys){
      if (current[key] != null && current[key].isNotEmpty){
        res[key] = current[key];
      }
    }
    return res;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      token: json['token'],
      phone: json['phone'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      imageId: json['image_id']
    );
  }
}