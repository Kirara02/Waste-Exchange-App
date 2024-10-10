class RegisterParams {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String passwordConfirmation;

  RegisterParams(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password,
      required this.passwordConfirmation});
}
