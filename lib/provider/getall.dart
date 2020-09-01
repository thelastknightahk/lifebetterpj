import 'package:get_it/get_it.dart';
import 'package:lifebetter/provider/dataProvider.dart';

final getIt= GetIt.instance;
void setUp(){
  getIt.registerSingleton<DataProvider>(DataProvider());
}