import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/ui/Home/home_cubit/cubit.dart';
import 'package:shop/ui/Home/home_cubit/states.dart';

class UsersListView extends StatelessWidget {
  const UsersListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var usersList = MainCubit.get(context).axisUsersModel.success;
          return ConditionalBuilder(
              condition: usersList != null,
              fallback: (context) => Center(child: CircularProgressIndicator()),
              builder: (context) => ListView.separated(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: usersList.length,
                    separatorBuilder: (context, index) => SizedBox(
                      height: 0,
                    ),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("${usersList[index].name}"),
                      );
                    },
                  ));
        });
  }
}
