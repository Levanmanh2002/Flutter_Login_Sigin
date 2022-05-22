import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class end extends StatefulWidget {
  const end({Key? key}) : super(key: key);

  @override
  State<end> createState() => _EndState();
}

class _EndState extends State<end> {
  String email = "", password = "";
  final _formKey = GlobalKey<FormState>();

  get validate => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Quên mật khẩu",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const Text(
                  "Vui lòng nhập gamil của bạn để lấy lại mật khẩu:",
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Theme(
                  data: ThemeData(hintColor: Colors.blue),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Vui lòng nhập gamil";
                      } else {
                        bool result = EmailValidator.validate(value);
                        if (result) {
                          return null;
                        } else {
                          return "Gmail không hợp lệ";
                        }
                      }
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Gamil",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 1)),
                      disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 1)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 1)),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: const Text(
                        'Gửi',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
