// ignore_for_file: avoid_print

import 'package:bai2/Dangnhap/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _repass = TextEditingController();
  bool isHidden = false;
  void validate() {
    if (formKey.currentState!.validate()) {
      print(" Xác nhận thành công...");
    } else {
      print("Xác nhận thất bại...");
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 0),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Tên của bạn',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Vui lòng nhập tên của bạn';
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Gmail',
                      prefixIcon: Icon(Icons.mail),
                    ),
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: 'Vui lòng nhập gmail'),
                        EmailValidator(errorText: 'Gmail không hợp lệ'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
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
                      controller: _pass,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Vui lòng nhập mật khẩu';
                        } else {
                          bool result = validatePassword(val);
                          if (result) {
                            return null;
                          } else {
                            return "Mật khẩu phải có: 8 ký tự, chữ hoa, chữ thường, số và các ký tự đặc biệt";
                          }
                        }
                      }),
                  const SizedBox(height: 16),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Nhập lại mật khẩu',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: isHidden
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 12, 134, 233),
                        ),
                      ),
                    ),
                    controller: _repass,
                    validator: (val) {
                      if (val!.isEmpty) return 'Vui lòng nhập mật khẩu';
                      if (val != _pass.text) return 'Mật khẩu không khớp';
                      return null;
                    },
                    onTap: () {
                      Navigator.push(
                          context,
                          // ignore: avoid_types_as_parameter_names
                          MaterialPageRoute(builder: (login) => const Login()));
                    },
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: 240,
                    margin: const EdgeInsets.only(top: 20),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'Bằng cách tham gia, bạn đồng ý với ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 107, 94, 94),
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Điều khoản và chính sách bảo mật của chúng tôi',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(310, 30)),
                      onPressed: validate,
                      child: const Text(
                        'Đăng Ký',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                      child: const Image(image: AssetImage("assets/img2.png")))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void passwordVisibility() => setState(() => isHidden = !isHidden);
}
