import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Password extends StatefulWidget {
  final TextEditingController controller;

  static var text;

  const Password({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _PasswordWidgetState createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<Password> {
  bool isHidden = false;
  // ignore: non_constant_identifier_names
  RegExp pass_valid = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
  bool validatePassword(String pass) {
    String password = pass.trim();
    if (pass_valid.hasMatch(password)) {
      return true;
    } else {
      return false;
    }
  }

  // ignore: non_constant_identifier_names
  TextEditingController Password = TextEditingController();
  @override
  Widget build(BuildContext context) => TextFormField(
      controller: Password,
      obscureText: isHidden,
      decoration: InputDecoration(
        hintText: 'Nhập mật khẩu',
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: isHidden
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          onPressed: passwordVisibility,
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.password],
      onEditingComplete: () => TextInput.finishAutofillContext(),
      validator: (value) {
        if (value!.isEmpty) {
          return "Vui lòng nhập mật khẩu";
        } else {
          bool result = validatePassword(value);
          if (result) {
            return null;
          } else {
            return "Mật khẩu không hợp lệ";
          }
        }
      });

  void passwordVisibility() => setState(() => isHidden = !isHidden);
}
