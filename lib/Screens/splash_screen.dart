import 'dart:async';

import 'package:chapter/Screens/emp_screen.dart';
import 'package:chapter/Screens/home_screen.dart';
import 'package:chapter/Screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'hr_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }
  @override
  void isLogin() async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    bool isLogin=sp.getBool('isLogin')??false;
    String userType=sp.getString('userType')??'';
    if(isLogin){

      if(userType=='Emp'){
        Timer(Duration(seconds:1),(){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>EmpScreen())
          );
        });
      }
      else if(userType=='Hr'){
        Timer(Duration(seconds:1),(){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>HrScreen())
          );
        });
      }
      Timer(Duration(seconds:1),(){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>HomeScreen())
        );
      });
    }
    else{
      Timer(Duration(seconds:1),(){
        Navigator.push(context,
            MaterialPageRoute(builder: (context)=>LoginScreen())
        );
      });
    }
  }
  Widget build(BuildContext context) {
    print('build');
    return  Scaffold(
        body: Image(
          height: double.infinity,
          fit: BoxFit.fitHeight,
          image: NetworkImage('https://images.pexels.com/photos/4060848/pexels-photo-4060848.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),),
    );
  }
}
