

import 'package:flutter/material.dart';
import 'package:movie_api/MOVIE/main_movie.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyAppLogin());
}

class MyAppLogin extends StatefulWidget {

  @override
  State<MyAppLogin> createState() => _MyAppLoginState();
}

class _MyAppLoginState extends State<MyAppLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      routes: {
        '/MyApp':(BuildContext context)=>MyApp(),
      },
      home: MyHomePageLogin(),
    );
  }
}

class MyHomePageLogin extends StatefulWidget {
  @override
  State<MyHomePageLogin> createState() => _MyHomePageLoginState();
}

class _MyHomePageLoginState extends State<MyHomePageLogin> {
  String? _username;

  String? _password;

  final _formkey = GlobalKey<FormState>();

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),
      body: Container(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                onSaved: (val) {
                  _username = val;
                },
                decoration: InputDecoration(hintText: "Username"),
              ),
              SizedBox(height: 20,),
              TextFormField(
                onSaved: (val) {
                  _password = val;
                },
                decoration: InputDecoration(hintText: "Password"),
              ),
              MaterialButton(color: Colors.blue,onPressed:_login,child: Text("Login"),)
            ],
          ),
        ),
      ),
    );


  }

  _login() async {
      final _form = _formkey.currentState;

      if(_form!.validate()){
        _form.save();
      }
      print("Helloworld");
      var response = await http.post(
          Uri.parse("https://reqres.in/api/login"),
          body:{
            "email": _username,
            "password": _password,
          }
      );
      print("Helloworld");

      if(response.statusCode == 200){
        print("Successful");
        Navigator.pushReplacementNamed(context, '/MyApp');
      }

    }

}
