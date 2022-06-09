import 'package:flutter/material.dart';
import 'package:image_api/Error/ErrorInternet.dart';
import 'package:image_api/Loadding/Loadding.dart';
import 'package:image_api/Logic/ImageLogic.dart';
import 'package:image_api/Model/ImageModel.dart';
import 'package:provider/provider.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ImageLogic>().setLoadding();
    context.read<ImageLogic>().read();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        title: Text("Image with APIs"),
      ),
      body: _buildBody,
    );
  }
  get _buildBody{
    Loadding loading = context.watch<ImageLogic>().loadding;
    List<ImageModel> imageModel = context.watch<ImageLogic>().imageModel;
    switch(loading){
      case Loadding.none:
      case Loadding.loadding:
        return _buildLoadding;
      case Loadding.error:
        return internetError();
      case Loadding.done:
        return _buildListView(imageModel);
    }

  }
  get _buildLoadding{
    return Center(child: CircularProgressIndicator());
  }
  _buildListView(List<ImageModel> item){
    return RefreshIndicator(
      child: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context,index){
          return _buildItems(item[index]);
        },
      ),
      onRefresh: () async{
        context.read<ImageLogic>().setLoadding();
        context.read<ImageLogic>().read();
      },
    );
  }
  _buildItems(ImageModel items){
    return Container(
      child: Card(
        elevation: 10,
        shadowColor: Colors.blue,
        child: Column(
          children: [
            Text(items.author,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(items.downloadUrl),
                    fit: BoxFit.cover
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
