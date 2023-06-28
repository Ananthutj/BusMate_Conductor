import 'package:busmate/Constants/constants.dart';
import 'package:busmate/Screens/conductor_home.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late String id;
  late String name;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Text("Log in",style: kBlackHeadingSize),
             const SizedBox(height: 13,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Email",style: kGreyTextStyle,),
                  ),
                  
                  TextFormField(
                     decoration: kTextFieldDecoration,
                     textAlign: TextAlign.center,
              ),
                ],
              ),
              const SizedBox(height:10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("Password",style: kGreyTextStyle,),
                  ),
                  
                  TextFormField(
                     decoration: kTextFieldDecoration,
                     textAlign: TextAlign.center,
                     obscureText: true,
                     obscuringCharacter: '*',
              ),
                ],
              ),
              const SizedBox(height: 40,),
              Container(
                width: double.infinity,
                height: 45,
                margin: const EdgeInsets.fromLTRB(0, 0, 0,0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage(id: 1234,name:'ABC',)));
                }, 
                  style: ElevatedButton.styleFrom(backgroundColor: kGreenMainTheme,shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                   child:const Text("Continue",style: TextStyle(fontSize: 16.7,fontWeight:FontWeight.w700),),
                  ),
                
              )
            ],
            
          ),
        ),
      ),
    );
  }
}