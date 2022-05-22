import 'package:bai2/DangKy/register.dart';
import 'package:bai2/Dangnhap/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TabController controller;
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: const TabBar(
              indicatorWeight: 1,
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              padding: EdgeInsets.all(20),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.only(left: 75.0, right: 75.0),
              unselectedLabelColor: Color.fromARGB(255, 178, 181, 181),
              labelColor: Color.fromARGB(255, 12, 134, 233),
              indicatorColor: Color.fromARGB(255, 39, 39, 44),
              tabs: [
                Tab(
                  text: "Đăng Nhập",
                ),
                Tab(
                  text: "Đăng Ký",
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Login(),
              Register(),
            ],
          ),
        ),
      );
}
