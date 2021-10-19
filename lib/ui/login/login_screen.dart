import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop/ui/Home/home_screen.dart';
import 'package:shop/ui/login/login_cubit/cubit.dart';
import 'package:shop/ui/login/login_cubit/states.dart';
import 'package:shop/utils/component/default_button.dart';
import 'package:shop/utils/component/default_form_field.dart';
import 'package:shop/utils/navigator.dart';

class LoginScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            navigateAndClearStack(context, HomeScreen());
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'LOGIN',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 30.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        DefaultFormField(
                          isObscure: false,
                          validator: validateEmail,
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        DefaultFormField(
                          validator: validatePassword,
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          suffix: ShopLoginCubit.get(context).suffixIcon,
                          isObscure: ShopLoginCubit.get(context).isSecure,
                          suffixPressed:(){
                            ShopLoginCubit.get(context).changeVisibility();
                          } ,

                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        if (state is! LoginLoadingState)
                          DefaultButton(
                            function: () {
                              if(formKey.currentState.validate()){
                                ShopLoginCubit.get(context).userLogin(
                                  context: context,
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            text: 'login',
                          ),
                        if (state is LoginLoadingState)
                          Center(child: CircularProgressIndicator()),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'REGISTER',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.length == 0)
      return 'أدخل الأيميل';
    else if (!regex.hasMatch(value))
      return 'أدخل أيميل صالح';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.length == 0)
      return 'ادخل الرقم السري';
    else if (value.length < 5)
      return 'أدخل رقم سري صالح';
    else
      return null;
  }
}