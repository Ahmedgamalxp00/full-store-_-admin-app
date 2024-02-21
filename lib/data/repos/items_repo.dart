import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:admin_app/core/app_links.dart';
import 'package:admin_app/core/errors/failures.dart';
import 'package:admin_app/core/utils/api_services.dart';
import 'package:get/get.dart';

class ItemsRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, Map<String, dynamic>>> view() async {
    try {
      var data = await apiService.post(link: AppLinks.viewitemsLink, data: {});

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

  Future<Either<Failure, Map<String, dynamic>>> add({
    required String name,
    required String namear,
    required String desc,
    required String descar,
    required String count,
    required String active,
    required String price,
    String? discount,
    required String categoryid,
    required File file,
  }) async {
    try {
      var data = await apiService.postRequestWithFile(
        link: AppLinks.additemLink,
        data: {
          "name": name,
          "namear": namear,
          "desc": desc,
          "descar": descar,
          "count": count,
          "active": active,
          "price": price,
          "discount": discount ?? '0',
          "categoryid": categoryid,
        },
        file: file,
      );

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

  Future<Either<Failure, Map<String, dynamic>>> edit({
    required String name,
    required String desc,
    required String descar,
    required String count,
    String? active,
    required String price,
    String? discount,
    required String categoryid,
    required String id,
    required String oldimage,
    required String namear,
    File? image,
  }) async {
    if (image != null) {
      try {
        var data = await apiService.postRequestWithFile(
            link: AppLinks.edititemLink,
            data: {
              "id": id,
              "name": name,
              "namear": namear,
              "desc": desc,
              "descar": descar,
              "count": count,
              "active": active ?? '1',
              "price": price,
              "discount": discount ?? '0',
              "categoryid": categoryid,
              "oldimage": oldimage,
            },
            file: image);

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
    } else {
      try {
        var data = await apiService.post(
          link: AppLinks.edititemLink,
          data: {
            "id": id,
            "name": name,
            "namear": namear,
            "desc": desc,
            "descar": descar,
            "count": count,
            "active": active ?? '1',
            "price": price,
            "discount": discount ?? '0',
            "categoryid": categoryid,
            "oldimage": oldimage,
          },
        );

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

  Future<Either<Failure, Map<String, dynamic>>> remove({
    required String id,
    required String image,
  }) async {
    try {
      var data = await apiService.post(
        link: AppLinks.removeitemLink,
        data: {
          "id": id,
          "image": image,
        },
      );

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
