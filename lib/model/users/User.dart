enum Gender { Nam, Nu }

class User {
  final String name;
  final String phoneNumber;
  final String level;
  final Gender gender;
  final String address;
  final Map<String, String> account;

  User({
    required this.name,
    required this.phoneNumber,
    required this.level,
    required String gender,
    required this.address,
    required this.account,
  }) : this.gender = gender == "Nam" ? Gender.Nam : Gender.Nu;
}
