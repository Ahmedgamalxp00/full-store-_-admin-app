import 'package:admin_app/core/utils/api_services.dart';
import 'package:dio/dio.dart';

import 'package:get/get.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put(ApiService());
  }
}
