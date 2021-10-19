import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/models/users_model.dart';
import 'package:shop/shared/block_observer.dart';
import 'package:shop/shared/constamts.dart';
import 'package:shop/ui/Home/home_screen.dart';
import 'package:shop/ui/login/login_screen.dart';
import 'package:shop/ui/login/login_cubit/cubit.dart';
import 'package:shop/ui/splash_screen.dart';
import 'package:shop/utils/cahe_helper.dart';
import 'package:shop/utils/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  await CacheHelper.init();
  token = CacheHelper.getData(key: 'userToken');
  print(token);

  runApp(
    MyApp(
      token: token,
    ),
  );
}

// 1. state less widget
// 2. state full widget

class MyApp extends StatelessWidget {
  String token;

  MyApp({
    this.token,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => ShopLoginCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(
          navigatedWidget: token != null ? HomeScreen() : LoginScreen(),
        ),
      ),
    );
  }
}
