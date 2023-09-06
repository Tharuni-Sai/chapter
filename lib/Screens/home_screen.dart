import 'package:chapter/Screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email='',age='';
  @override
  void initState(){
    super.initState();
    loadData();
  }
  loadData()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    email=sp.getString('Email')?? '';
    age=sp.getString('Age')?? '';
    setState(() {

    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcom Home",style: TextStyle(
                color: Colors.purple,
                fontSize: 20,
            fontStyle: FontStyle.italic
            ),
            ),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Email'),
                Text(email.toString()),

              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Age'),
                Text(age.toString()),

              ],
            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: ()async{
                SharedPreferences sp=await SharedPreferences.getInstance();
                sp.clear();
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex)=>LoginScreen()));
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
                  child: Text("Log out",
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
