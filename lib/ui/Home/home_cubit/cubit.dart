import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/models/axis_manager.dart';
import 'package:shop/shared/constamts.dart';
import 'package:shop/ui/Home/home_cubit/states.dart';
import 'package:shop/ui/Screens/categories_screen.dart';
import 'package:shop/ui/Screens/home_screen.dart';
import 'package:shop/ui/Screens/profile_screen.dart';
import 'package:shop/utils/dio_helper.dart';
import 'package:shop/utils/end_points.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  AxisUsersModel axisUsersModel;

  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    CategoriesScreen(),
    ProfileScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
    // if (index == 2) {}
  }

  void getUsers({
    BuildContext context,
    String email,
    String password,
  }) {
    emit(UsersLoadingState());

    DioHelper.getData(
      url: USERS,
      token: token
    ).then((value) {
      axisUsersModel = AxisUsersModel.fromJson(value.data);
      print("LENGTH :: ${axisUsersModel.success.length}");
      emit(UsersSuccessState());

    }).catchError((error) {
      print("ERROR :: $error");
      emit(UsersErrorState());
    });
  }

}
