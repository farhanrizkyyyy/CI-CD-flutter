import 'package:ci_cd_app/home/models/user.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Dio _dio = Dio();
  RxList<User> users = <User>[].obs;

  @override
  onInit() {
    getUsers();
    super.onInit();
  }

  getUsers() async {
    const url = 'https://jsonplaceholder.typicode.com/users';
    var response = await _dio.get(url);
    if (response.data.isNotEmpty) {
      users.value = List.generate(response.data.length, (index) {
        return User.fromJson(response.data[index]);
      });
    }
  }
}
