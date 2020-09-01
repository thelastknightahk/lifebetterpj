import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:lifebetter/model/Data/CourseDataHelper.dart';
import 'package:lifebetter/model/NoInternet/Error.dart';

class DataProvider extends ChangeNotifier{
  final _helper = CourseDataHelper();
  final _healthcontroller = StreamController<Either<ErrorPage,List<dynamic>>>();
  final _androidcontroller = StreamController<Either<ErrorPage,List<dynamic>>>();
  final _webcontroller = StreamController<Either<ErrorPage,List<dynamic>>>();
  final _copywritecontroller = StreamController<Either<ErrorPage,List<dynamic>>>();
  final _handmadecontroller = StreamController<Either<ErrorPage,List<dynamic>>>();
  
  Stream<Either<ErrorPage,List<dynamic>>> get healthDataStream {
    return _healthcontroller.stream;
  }
  Future<void> getHealth() async{
    var data = await _helper.gethealthDetaHelp();
    _healthcontroller.add(data);
  }
  
  Stream<Either<ErrorPage,List<dynamic>>> get androidDataStream {
    return _androidcontroller.stream;
  }
  Future<void> getAndroid() async{
    var data = await _helper.getAndroidData();
    _androidcontroller.add(data);
  }
  
  Stream<Either<ErrorPage,List<dynamic>>> get webDataStream {
    return _webcontroller.stream;
  }
  Future<void> getWeb() async{
    var data = await _helper.getWebData();
    _webcontroller.add(data);
  }
  
  Stream<Either<ErrorPage,List<dynamic>>> get copyWriteStream {
    return _copywritecontroller.stream;
  }
  Future<void> getCpy() async{
    var data = await _helper.gethealthDetaHelp();
    _copywritecontroller.add(data);
  }

  Stream<Either<ErrorPage,List<dynamic>>> get handmadeStream {
    return _handmadecontroller.stream;
  }
  Future<void> getHandmade() async{
    var data = await _helper.getHandmade();
    _handmadecontroller.add(data);
  }

}