import 'package:bai2/Dangnhap/Button.dart';
import 'package:bai2/Dangnhap/pass_end.dart';
import 'package:bai2/Dangnhap/Password.dart';
import 'package:bai2/Dangnhap/email.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  get yourCallbackFunction => '';
  bool isChecked = false;
  late Box box1;
  void getdata() async {
    if (box1.get('email') != null) {
      EmailWight.text = box1.get('email');
      isChecked = true;
      setState(() {});
    }
    if (box1.get('pass') != null) {
      Password.text = box1.get('pass');
      isChecked = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
              child: AutofillGroup(
                child: Column(
                  children: [
                    EmailWight(controller: emailController),
                    const SizedBox(height: 16),
                    Password(controller: passwordController),
                    const SizedBox(
                      height: 20,
                    ),
                    buildLeftRightPassword(),
                    buildButton(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildText(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildNoAccount(),
                    buildIamge(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildButton() => ButtonWidget(
        text: 'Đăng nhập',
        onClicked: login,
      );

  void login() {
    final form = formKey.currentState!;
    if (form.validate()) {
      box1.put('emalil', EmailWight.text);
      box1.put('pass', Password.text);
    }
  }

  Widget buildLeftRightPassword() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              isChecked = !isChecked;
              setState(() {});
            },
          ),
          const Text(
            'Ghi nhớ mật khẩu',
          ),
          TextButton(
            child: const Text(
              'Quên mật khẩu',
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (login) => const end()));
            },
          ),
        ],
      );

  Widget buildText() => (const Text(
        'Hoặc kết nối với',
        style: TextStyle(fontSize: 20),
      ));

  Widget buildNoAccount() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Row(
              children: [
                Image.asset(
                  'assets/facebook.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/google.png',
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          )
        ],
      );
  Widget buildIamge() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              children: [
                Image.asset(
                  'assets/img2.png',
                  width: 310,
                  height: 310,
                ),
              ],
            ),
          ),
        ],
      );
}
