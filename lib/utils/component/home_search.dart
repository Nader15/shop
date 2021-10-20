import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.2),
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        // height: 60,
        child: TextFormField(
          style: TextStyle(color: Colors.black),
          onChanged: (text) {
            // setState(() {});
          },
          cursorColor: Colors.black,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide.none),
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.white)),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            hintText: "Find your destination ...",
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            // enabledBorder: InputBorder.none,
            // border: OutlineInputBorder(
            //     borderSide:
            //         BorderSide(color: primaryAppColor, width: .8)),
          ),
        ),
      ),
    );
  }
}
