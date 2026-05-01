enum UserRole { customer, courier, admin }

class UserModel {
  final String id;
  final String name;
  final String email;
  final UserRole role;
  final String? phoneNumber;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.phoneNumber,
  });
}
