import 'package:ci_cd_app/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body,
    );
  }

  get _appBar {
    return AppBar(
      title: const Text('Flutter CI/CD Trial'),
    );
  }

  get _body {
    var controller = Get.put(HomeController());

    return Column(
      children: List.generate(controller.users.length, (index) {
        return Text('${controller.users[index].name}');
      }),
    );
  }
}
