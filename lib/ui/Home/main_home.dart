import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/main.dart';
import 'package:shop/shared/constamts.dart';
import 'package:shop/ui/Home/home_cubit/cubit.dart';
import 'package:shop/ui/Home/home_cubit/states.dart';
import 'package:shop/utils/cahe_helper.dart';
import 'package:shop/utils/colors.dart';
import 'package:shop/utils/custom_drawer.dart';
import 'package:shop/utils/icons_broken.dart';
import 'package:shop/utils/navigator.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {
          if(state is UsersSuccessState){

          }
        },
        builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Scaffold(
            drawer: CustomDrawer(),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.Home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.Category), label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(IconBroken.Profile), label: 'Profile'),
              ],
            ),
            appBar: AppBar(
              backgroundColor: whiteColor,
              elevation: 0,
              title: Text("Home"),
              actions: [
                // IconButton(
                //     icon: Icon(Icons.logout),
                //     onPressed: () {
                //       logOut(context);
                //     }),
                IconButton(icon: Icon(Icons.shopping_cart_outlined), onPressed: () {})
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        });
  }
}
