import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:movie_api/MOVIE/api_section.dart';

import 'model_class.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     context.read<APISection>().fetchData();
    return Consumer<APISection>(
        builder: (context, value, child) => value.data.length != 0
            ? ListView.builder(
                itemCount: value.data.length,
                itemBuilder: (context, index) => Card(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Image.network(value.data[index]["poster"])
                  ),
                ),
              )
            : CircularProgressIndicator());
  }
}
