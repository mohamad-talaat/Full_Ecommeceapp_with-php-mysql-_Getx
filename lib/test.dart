import 'package:e_commerce_app/core/functions/ckeckInternet.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  ckeck() async {
    var res = await checkTheInternet();
    debugPrint(res);
  }

  @override
  void initState() {
    ckeck();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: const [],
          )),
    );
  }
}
