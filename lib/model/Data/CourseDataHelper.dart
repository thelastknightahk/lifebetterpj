import 'package:dartz/dartz.dart';
import 'package:lifebetter/model/Data/CourseData.dart';
import 'package:lifebetter/model/NoInternet/Error.dart';
import 'package:lifebetter/model/NoInternet/ErrorHelper.dart';

class CourseDataHelper {
  final api = CourseData();
  Future<Either<ErrorPage, List<dynamic>>> gethealthDetaHelp() async {
    final apiResult = await api.fetchHealth();
    return apiResult.fold((l) {
      return Left(ErrorHelper());
    }, (r) {
      return Right(r);
    });
  }

  Future<Either<ErrorPage, List<dynamic>>> getAndroidData() async {
    final apiResult = await api.fetchAndroid();
    return apiResult.fold((l) {
      return Left(ErrorHelper());
    }, (r) {
      return Right(r);
    });
  }

  Future<Either<ErrorPage, List<dynamic>>> getWebData() async {
    final apiResult = await api.fetchWeb();
    return apiResult.fold((l) {
      return Left(ErrorHelper());
    }, (r) {
      return Right(r);
    });
  }

  Future<Either<ErrorPage, List<dynamic>>> getCopyWrite() async {
    final apiResult = await api.fetchCpy();
    return apiResult.fold((l) {
      return Left(ErrorHelper());
    }, (r) {
      return Right(r);
    });
  }

  Future<Either<ErrorPage, List<dynamic>>> getHandmade() async {
    final apiResult = await api.fetchHandmade();
    return apiResult.fold((l) {
      return Left(ErrorHelper());
    }, (r) {
      return Right(r);
    });
  }
}
