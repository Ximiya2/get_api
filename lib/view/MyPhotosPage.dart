import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_api/model.dart';
import 'package:get_api/view/widget/image_item.dart';
import '../service/cat_service.dart';

class MyPhotosPage extends StatefulWidget {
   MyPhotosPage({this.item,Key? key}) : super(key: key);
  ImageModel? item;
  @override
  State<MyPhotosPage> createState() => _MyPhotosPageState();
}

class _MyPhotosPageState extends State<MyPhotosPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Your Images', style: TextStyle(color: Colors.white),),
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder(
            future: CatService.getImageYou(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return PhotoItem(context,snapshot.data![index],);
                  },
                );
              } else {
                return const Center(
                  child: Text('No data',),);
              }
            }),
      ),
    );
  }
}
