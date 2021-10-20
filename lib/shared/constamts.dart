
import 'package:flutter/material.dart';
import 'package:shop/main.dart';
import 'package:shop/utils/cahe_helper.dart';
import 'package:shop/utils/navigator.dart';

String token;
String name;
String email;

logOut(BuildContext context){
  CacheHelper.removeData(key: 'userToken').then((value) {
    if(value){
      navigateAndClearStack(context, MyApp());
    }
  }).catchError((error){
    print(error);
  });
}