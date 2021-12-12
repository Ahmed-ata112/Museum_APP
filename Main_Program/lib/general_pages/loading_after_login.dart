import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading_after_login extends StatefulWidget {
  const loading_after_login({Key? key}) : super(key: key);

  @override
  _loading_after_loginState createState() => _loading_after_loginState();
}

class _loading_after_loginState extends State<loading_after_login> {
  Future<void> getData() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context);
      print('returned');
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('hi');
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SpinKitDoubleBounce(
      color: Colors.white,
      size: 80.0,
    ));
  }
}