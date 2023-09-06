import 'dart:ffi';

import 'package:chapter/Screens/emp_screen.dart';
import 'package:chapter/Screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formDate=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final ageController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "Email"
              ),
            ),
              SizedBox(height: 10,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Password"
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "Age"
              ),
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: ()async{
                SharedPreferences sp=await SharedPreferences.getInstance();
                sp.setString('Email', emailController.text.toString());
                sp.setString('Age', ageController.text.toString());
                // admin ,emp,Hr
                sp.setString('UserType', 'Hr');
                sp.setBool('isLogin',true );
                if(sp.getString('user type')=='Hr'){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (contex)=>EmpScreen()));
                }
                else if(sp.getString('user type')=='Emp'){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (contex)=>EmpScreen()));
                }
                else{
                  Navigator.push(context,
                      MaterialPageRoute(builder: (contex)=>EmpScreen()));
                }
              },
              child: Container(
                height: 70,
                width: double.infinity,
                // color: Colors.purple,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: Colors.purple[400],
                ),
                child:
                Center (
                  child: Text("Sign up",
                    style: TextStyle(fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20
                    ),
                  ),
                ),),
            )
          ],
        ),
      ),
    );
  }

}
