import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop/models/users_model.dart';
import 'package:shop/ui/Home/home_screen.dart';
import 'package:shop/ui/login/login_cubit/states.dart';
import 'package:shop/utils/cahe_helper.dart';
import 'package:shop/utils/dio_helper.dart';
import 'package:shop/utils/end_points.dart';

class ShopLoginCubit extends Cubit<LoginStates> {
  ShopLoginCubit() : super(LoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  UsersModel userModel;

  void userLogin({
    BuildContext context,
     String email,
     String password,
  }) {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
        "device_name": "device_name",
      },
    ).then((value) {

      //
      // if(userModel.token!=null)
      // {
      //   print(userModel.user.name);
      //   print(userModel.user.email);
      //

      //
      //   emit(LoginSuccessState());
      // } else
      // {
      //   emit(LoginSuccessState());
      // }

      if (!(value.data).toString().contains('error')) {
        userModel = UsersModel.fromJson(value.data);
        CacheHelper.putData(key: 'userToken', value: userModel.token);
        Fluttertoast.showToast(msg: "Hello ${userModel.user.name}",backgroundColor: Colors.green);
        print(userModel.token);
        print(userModel.user.toJson());
        emit(LoginSuccessState());

      }else{
        Fluttertoast.showToast(msg: value.data['error'],backgroundColor: Colors.red);
        emit(LoginErrorState(error: value.data['error']));
      }


    }).catchError((error) {
      print(error);
      emit(LoginErrorState(error: error.toString()));
    });
  }
  IconData suffixIcon = Icons.visibility_outlined;
  bool isSecure = true;

  void changeVisibility(){
    isSecure = !isSecure;
    suffixIcon = isSecure ? Icons.visibility_outlined : Icons.visibility_off_outlined ;
    emit(VisibilityState());
  }
}