
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'model_class.dart';

class APISection extends ChangeNotifier{
  List<dynamic> data = [];


  void fetchData() async{
    final response = await http.get(Uri.parse("https://api.jsonbin.io/b/6203c5d54ce71361b8d4bf97"));

    if(response.statusCode == 200){
      try {
        data = jsonDecode(response.body);
        notifyListeners();
        print(data[0]["id"]);
        print("Successful");

      }catch(e){
        print("Unsuccessful");

     }
    }
  }
}