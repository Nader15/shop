import 'package:flutter/material.dart';
import 'package:shop/shared/constamts.dart';
import 'package:shop/utils/navigator.dart';


class SplashScreen extends StatefulWidget {

  Widget navigatedWidget;
  SplashScreen({this.navigatedWidget});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(token);
    Future.delayed(Duration(seconds: 3), () {

      navigateAndClearStack(context, widget.navigatedWidget);

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LinearProgressIndicator(),
            Spacer(),
            Center(child: Icon(Icons.add_shopping_cart,size: 50,)),
            Spacer(),
          ],
        ),
        // Column(
        //   children: [
        //     Spacer(flex: 2),
        //     // Image.asset("assets/images/welcome_image.png"),
        //     Icon(Icons.add_shopping_cart),
        //     Spacer(flex: 3), Text(
        //       "Welcome to our freedom \nmessaging app",
        //       textAlign: TextAlign.center,
        //       style: Theme.of(context)
        //           .textTheme
        //           .headline5
        //           .copyWith(fontWeight: FontWeight.bold),
        //     ),
        //     Spacer(),
        //     Text(
        //       "Freedom talk any person of your \nmother language.",
        //       textAlign: TextAlign.center,
        //       style: TextStyle(
        //         color: Theme.of(context)
        //             .textTheme
        //             .bodyText1
        //             .color
        //             .withOpacity(0.64),
        //       ),
        //     ),
        //     Spacer(flex: 3),
        //
        //   ],
        // ),
      ),
    );
  }
}
