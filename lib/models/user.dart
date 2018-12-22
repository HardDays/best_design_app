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

  Map <String, dynamic> toJson(){
    Map <String, dynamic> res = {
      'id': id,
      'token': token,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
    if (base64 != null){
      res['image'] = {
        'base64': base64
      };
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