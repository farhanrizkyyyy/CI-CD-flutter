import 'dart:developer';

import 'package:ci_cd_app/home/models/album.dart';
import 'package:ci_cd_app/home/models/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Dio _dio = Dio();

  RxList<User> users = <User>[].obs;
  RxList<Album> albums = <Album>[].obs;

  RxBool isLoading = true.obs;

  @override
  onInit() {
    getAlbums();
    super.onInit();
  }

  getUsers() async {
    try {
      const url = 'https://jsonplaceholder.typicode.com/users';
      var response = await _dio.get(url);
      if (response.data.isNotEmpty) {
        users.value = List.generate(response.data.length, (index) {
          return User.fromJson(response.data[index]);
        });
      }
    } catch (e) {
      log('$e');
    }
  }

  getAlbums() async {
    try {
      const url = 'https://jsonplaceholder.typicode.com/albums';
      var response = await _dio.get(url);

      if (response.data.isNotEmpty) {
        albums.value = List.generate(response.data.length, (index) {
          return Album.fromJson(response.data[index]);
        });
        // log('LIST OF ALBUM: ${albums[index]}');

        isLoading.value = false;
      }
    } catch (e) {
      log('$e');
    }
  }
}
