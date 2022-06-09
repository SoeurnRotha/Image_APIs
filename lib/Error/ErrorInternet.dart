import 'package:flutter/material.dart';
import 'package:image_api/Logic/ImageLogic.dart';
import 'package:provider/provider.dart';
class internetError extends StatefulWidget {
  const internetError({Key? key}) : super(key: key);

  @override
  State<internetError> createState() => _internetErrorState();
}

class _internetErrorState extends State<internetError> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text("Error internet"),
          ElevatedButton(
            child: Text("Try again"),
            onPressed: (){
              context.read<ImageLogic>().setLoadding();
              context.read<ImageLogic>().read();
            },
          )
        ],
      ),
    );
  }
}
