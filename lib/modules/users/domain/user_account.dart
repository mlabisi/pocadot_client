class UserAccount {
  UserAccount({
    required this.id,
    required this.email,
    required this.country,
    required this.language,
    required this.firstName,
    required this.lastName
});

  factory UserAccount.fromJson(Map<String, dynamic> json) {
    return UserAccount(
      id: json['id'],
      email: json['email'],
      country: json['country'],
      language: json['language'],
      firstName: json['firstName'],
      lastName: json['lastName']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'country': country,
      'language': language,
      'firstName': firstName,
      'lastName': lastName
    };
  }

  final String id;
  final String email;
  final String country;
  final String language;
  final String firstName;
  final String lastName;
}
