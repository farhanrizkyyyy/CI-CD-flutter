import 'package:ci_cd_app/home/home_controller.dart';
import 'package:ci_cd_app/home/models/album.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Flutter CI/CD Trial'),
    );
  }

  Widget _buildBody() {
    var controller = Get.put(HomeController());

    return Obx(() {
      if (controller.albums.isNotEmpty) {
        return ListView.separated(
          padding: const EdgeInsets.all(20),
          itemBuilder: (context, index) {
            return _buildContainer(controller.albums[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: controller.albums.length,
        );
      }

      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  Widget _buildContainer(Album album) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Text(album.title!),
      ),
    );
  }
}
