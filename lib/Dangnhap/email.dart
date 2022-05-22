// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class EmailWight extends StatefulWidget {
  final TextEditingController controller;

  static var text;

  const EmailWight({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _EmailWightState createState() => _EmailWightState();
}

class _EmailWightState extends State<EmailWight> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);
    super.dispose();
  }

  void onListen() => setState(() {});
  // ignore: non_constant_identifier_names
  TextEditingController EmailWight = TextEditingController();

  @override
  Widget build(BuildContext context) => TextFormField(
      controller: EmailWight,
      decoration: InputDecoration(
        hintText: 'G-mail',
        prefixIcon: const Icon(Icons.mail),
        suffixIcon: widget.controller.text.isEmpty
            ? Container(width: 0)
            : IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => widget.controller.clear(),
              ),
      ),
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return "Vui lòng nhập gmail";
        } else {
          bool result = EmailValidator.validate(value);
          if (result) {
            return null;
          } else {
            return "Gmail không hợp lệ";
          }
        }
      });
}
