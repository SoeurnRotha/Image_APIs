import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_api/Logic/ImageLogic.dart';
import 'package:image_api/Page/MainPage.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(imageAPIs());
}
class imageAPIs extends StatelessWidget {
  const imageAPIs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> ImageLogic()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
