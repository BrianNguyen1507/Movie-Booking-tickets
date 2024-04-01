import 'Account.dart';

class User {
  final String id;
  final String name;
  final String phoneNumber;
  final String level;
  final String address;
  final Account account;

  User({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.level,
    required this.address,
    required this.account,
  });

  factory User.fromJson(Map<String, dynamic> userData) {
    return User(
      id: userData['id'],
      name: userData['name'],
      phoneNumber: userData['phoneNumber'],
      level: userData['level'],
      address: userData['address'],
      account: Account(
        username: userData['account']['user_name'],
        password: userData['account']['password'],
      ),
    );
  }
}
