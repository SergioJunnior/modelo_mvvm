class RegisterModel {
  final String name;
  final String email;
  final String password;
  final String? state;

  RegisterModel({
    required this.name,
    required this.email,
    required this.password,
    this.state,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      state: json['state'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': email, 'password': password};
  }
}
