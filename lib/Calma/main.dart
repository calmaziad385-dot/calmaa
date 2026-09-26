import 'package:flutter/material.dart';

import 'one_screen.dart';
void main(){
  runApp(MyAPP());
}
class MyAPP extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OneScreen ()
    );
  }
}