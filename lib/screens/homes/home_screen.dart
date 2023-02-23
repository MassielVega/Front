import 'package:flutter/material.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget{
  static String routeName = "/homes";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Body(),
    );
  }
}