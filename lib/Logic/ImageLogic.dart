import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:image_api/Loadding/Loadding.dart';
import 'package:image_api/Model/ImageModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
class ImageLogic extends ChangeNotifier{
  List<ImageModel> _imageModel = [];
  List<ImageModel> get imageModel => _imageModel;

  Loadding _loadding = Loadding.none;
  Loadding get loadding =>_loadding;

  void setLoadding(){
    _loadding = Loadding.loadding;
    notifyListeners();

  }
  void read() async{
    try{
      const String url = "https://picsum.photos/v2/list?page=2&limit=200";
      http.Response response = await http.get(Uri.parse(url));
      if(response.statusCode == 200){
        _loadding = Loadding.done;
        _imageModel = await compute(_data,response.body);
      }else{
        print("Error");
      }
    }catch(e){

    }finally{
      notifyListeners();
    }
  }
}
List<ImageModel> _data(String jsonString){

  List list = json.decode(jsonString);
  return list.map((e) => ImageModel.fromMap(e)).toList();
}