import 'package:ci_cd_app/home/home_controller.dart';
import 'package:ci_cd_app/home/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeUsersView extends StatelessWidget {
  const HomeUsersView({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        return _buildContainer(controller.users[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemCount: controller.users.length,
    );
  }

  Widget _buildContainer(User user) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Text(user.name!),
      ),
    );
  }
}
