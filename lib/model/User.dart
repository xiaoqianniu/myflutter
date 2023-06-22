
class User{
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final String? image;


User(
{
required this.username,
required this.email,
required this.password,
  required this.confirmPassword,
 this.image
}
);

  /* Named constructor to return a user object representing "no user"
       to avoid dealing with nulls (e.g., when a user is not found)
   */
  User.noUser(): username="", email="", password="", confirmPassword="", image="";

  bool isNoUser() {
    return email == "";
  }

/// named constructor
  User.fromJson(Map<String, dynamic> json)
      :username = json['username'],
        email = json['email'],
        password = json['password'],
  confirmPassword=json['confirmPassword'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'email': email,
    'password': password,
    'confirmPassword':confirmPassword,
    'image': image
  };
}

