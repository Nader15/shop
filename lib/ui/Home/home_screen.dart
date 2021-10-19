import 'package:flutter/material.dart';
import 'package:shop/main.dart';
import 'package:shop/utils/cahe_helper.dart';
import 'package:shop/utils/navigator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: (){
            CacheHelper.removeData(key: 'userToken').then((value) {
              if(value){
                navigateAndClearStack(context, MyApp());
              }
            }).catchError((error){
              print(error);
            });

          })
        ],
      ),
    );
  }
}
