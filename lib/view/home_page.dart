import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_api/view/widget/image_item.dart';
import '../service/cat_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Images', style: TextStyle(color: Colors.white),),
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder(
            future: CatService.getImage(),
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
