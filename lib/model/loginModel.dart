class loginBody {
  String email;
  loginBody({
    required this.email,
  });
  Map<String, dynamic> toJson() => {
    "email":email
  };

  factory loginBody.fromJson(Map<String, dynamic> json) => loginBody(
    email: json["email"],
  );

}
