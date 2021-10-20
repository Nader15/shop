import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/ui/Home/home_cubit/cubit.dart';
import 'package:shop/ui/Home/home_cubit/states.dart';
import 'package:shop/utils/component/home_search.dart';
import 'package:shop/utils/component/home_slider.dart';
import 'package:shop/utils/component/users_listView.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // var usersList = MainCubit.get(context).axisUsersModel.success;
          return Scaffold(
              body: SingleChildScrollView(
            child: Column(
              children: [
                HomeSearch(),

                UsersListView(),
              ],
            ),
          ));
        });
  }
}
