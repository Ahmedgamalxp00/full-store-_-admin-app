import 'package:admin_app/core/app_links.dart';
import 'package:admin_app/core/errors/failures.dart';
import 'package:admin_app/core/utils/api_services.dart';
import 'package:dartz/dartz.dart';

import 'package:dio/dio.dart';

import 'package:get/get.dart';

class OrderRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, Map>> view() async {
    try {
      var data = await apiService.post(link: AppLinks.ordersViewLink, data: {});
      if (data['status'] == 'success') {
        return right(data);
      } else {
        return left(ServerFailure(data['massage']));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErorr(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Map>> archived() async {
    try {
      var data = await apiService.post(link: AppLinks.archivedLink, data: {});
      if (data['status'] == 'success') {
        return right(data);
      } else {
        return left(ServerFailure(data['massage']));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErorr(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Map>> approve({
    required String orderId,
    required String userId,
  }) async {
    try {
      var data = await apiService.post(link: AppLinks.approveOrderLink, data: {
        "user_id": userId,
        "order_id": orderId,
      });
      if (data['status'] == 'success') {
        return right(data);
      } else {
        return left(ServerFailure(data['massage']));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErorr(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Map>> prepere({
    required String orderType,
    required String orderId,
    required String userId,
  }) async {
    try {
      var data = await apiService.post(link: AppLinks.prepareLink, data: {
        "order_type": orderType,
        "user_id": userId,
        "order_id": orderId,
      });
      if (data['status'] == 'success') {
        return right(data);
      } else {
        return left(ServerFailure(data['massage']));
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErorr(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
