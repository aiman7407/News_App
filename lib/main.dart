import 'package:flutter/material.dart';
import 'package:news_app/service/network/dio_helper.dart';
import 'package:news_app/service/storage/cache_helper.dart';
import 'package:news_app/src/app_root.dart';

void main()
async{

  //Ensure that this functions run before run app
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark=CacheHelper.getData(key: 'isDark');

  runApp(AppRoot(isDark: isDark,));

}




