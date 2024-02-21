import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:admin_app/core/app_links.dart';
import 'package:admin_app/core/errors/failures.dart';
import 'package:admin_app/core/utils/api_services.dart';
import 'package:get/get.dart';

class CategoriesRepo {
  ApiService apiService = Get.find();
  Future<Either<Failure, Map<String, dynamic>>> view() async {
    try {
      var data =
          await apiService.post(link: AppLinks.viewCategoriesLink, data: {});

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
    required File file,
  }) async {
    try {
      var data = await apiService.postRequestWithFile(
        link: AppLinks.addCategoryLink,
        data: {
          "name": name,
          "namear": namear,
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
    required String id,
    required String oldimage,
    required String namear,
    File? image,
  }) async {
    if (image != null) {
      try {
        var data = await apiService.postRequestWithFile(
            link: AppLinks.editCategoryLink,
            data: {
              "id": id,
              "name": name,
              "namear": namear,
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
          link: AppLinks.editCategoryLink,
          data: {
            "id": id,
            "name": name,
            "namear": namear,
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
        link: AppLinks.removeCategoryLink,
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
