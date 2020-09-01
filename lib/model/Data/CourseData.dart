import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class CourseData {
  String healthUrl =
      "http://gsx2json.com/api?id=1h2yaK2cH4q_F376f0kytBW_qRG2x-iXwEzHOzR4HpVQ&sheet=1";
  String androidUrl =
      "http://gsx2json.com/api?id=1h2yaK2cH4q_F376f0kytBW_qRG2x-iXwEzHOzR4HpVQ&sheet=1";
  String webUrl =
      "http://gsx2json.com/api?id=1h2yaK2cH4q_F376f0kytBW_qRG2x-iXwEzHOzR4HpVQ&sheet=1";
  String copyWrite =
      "http://gsx2json.com/api?id=1h2yaK2cH4q_F376f0kytBW_qRG2x-iXwEzHOzR4HpVQ&sheet=1";
  String handmade =
      "http://gsx2json.com/api?id=1h2yaK2cH4q_F376f0kytBW_qRG2x-iXwEzHOzR4HpVQ&sheet=1";

  Future<Either<Exception, List<dynamic>>> fetchHealth() async {
    try {
      final response = await http.get(healthUrl);
      List<dynamic> data;
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);
        data = map["rows"];
      } else {
        throw Exception('Failed to load photos');
      }

      return Right(data);
    } catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, List<dynamic>>> fetchAndroid() async {
    try {
      final response = await http.get(androidUrl);
      List<dynamic> data;
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);
        data = map["rows"];
      } else {
        throw Exception('Failed to load photos');
      }

      return Right(data);
    } catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, List<dynamic>>> fetchWeb() async {
    try {
      final response = await http.get(webUrl);
      List<dynamic> data;
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);
        data = map["rows"];
      } else {
        throw Exception('Failed to load photos');
      }

      return Right(data);
    } catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, List<dynamic>>> fetchCpy() async {
    try {
      final response = await http.get(copyWrite);
      List<dynamic> data;
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);
        data = map["rows"];
      } else {
        throw Exception('Failed to load photos');
      }

      return Right(data);
    } catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, List<dynamic>>> fetchHandmade() async {
    try {
      final response = await http.get(handmade);
      List<dynamic> data;
      if (response.statusCode == 200) {
        Map<String, dynamic> map = json.decode(response.body);
        data = map["rows"];
      } else {
        throw Exception('Failed to load photos');
      }

      return Right(data);
    } catch (e) {
      return Left(e);
    }
  }
}
