
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_api/model.dart';
import '../../service/cat_service.dart';
import '../../utils/utils_service.dart';

Widget PhotoItem(BuildContext context,ImageModel image,) {
  return Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          )
        ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          image.url,
          height: 114,
          fit: BoxFit.cover,
        ),
        IconButton(
            onPressed: () async {
              bool result = await CatService.deleteImage(image.id);
              if(result){
                Utils.snackBarSuccess('Deleted successfully', context);
              } else {
                Utils.snackBarError('Someting is wrong', context);
              }
            },
            icon: Icon(Icons.delete)),
      ],
    ),
  );
}