import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import '../core/api/api.dart';
import '../core/config/dio_config.dart';
import '../model.dart';
import 'log_service.dart';

class CatService {
  static final CatService _inheritance = CatService._init();

  static CatService get inheritance => _inheritance;

  CatService._init();

  static Future<bool> uploadImage(String path) async {
    Log.wtf(path);
    try {
      FormData formData = FormData.fromMap(
          {'file': await MultipartFile.fromFile(path,
              contentType: MediaType("image", "jpeg"))}
      ); // or png


      Response res = await DioConfig.inheritance.createRequest().post(
          Urls.uploadImage,
          data: formData,
          options: Options(headers: {
            "Content-Type": "multipart/form-data",
            "x-api-key": Urls.myApiKey
          }));
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if (res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e("${res.statusMessage} ${res.statusCode}");
        return false;
      }
    } on DioError catch (e) {
      if (e.response != null) {
        Log.i(e.response!.statusCode.toString() + e.message!
          ..toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
  }

  static Future<List<ImageModel>?> getImage() async {
    try {
      Response res = await DioConfig.inheritance.createRequest().get(
          Urls.getImages,
          options: Options(headers: {
              "Content-Type": "application/json",
              "x-api-key": Urls.key
          })
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200) {
        List<ImageModel> ImageList = [];
        for(var e in (res.data as List)) {
          ImageList.add(ImageModel.fromJson(e));
        }

        return ImageList;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
      }
    } on DioError catch (e) {
      Log.e(e.toString());
      if(e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());

    }
    return null;
  }

  static Future<List<ImageModel>?> getImageYou() async {
    try {
      Response res = await DioConfig.inheritance.createRequest().get(
          Urls.getImages,
          options: Options(headers: {
            "Content-Type": "application/json",
            "x-api-key": Urls.myApiKey
          }));
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200) {
        List<ImageModel> imageList = [];
        for(var e in (res.data as List)) {
          imageList.add(ImageModel.fromJson(e));
        }

        return imageList;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
      }
    } on DioError catch (e) {
      Log.e(e.toString());
      if(e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());

    }
    return null;
  }

  static Future<bool> deleteImage(String id) async {
    try {
      Response res = await DioConfig.inheritance.createRequest().delete(
        Urls.deleteImage + id.toString(),
          options: Options(headers: {
            "Content-Type": "multipart/form-data",
            "x-api-key": Urls.myApiKey
          })
      );
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200 || res.statusCode == 201) {
        return true;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
        return false;
      }
    } on DioError catch (e) {
      if(e.response != null) {
        Log.e(e.response!.toString());
        return false;
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());
      return false;
    }
    // return null;
  }
 }


//



// static Future<bool> editUser(UserModel newPost) async {
//   try {
//     Response res = await DioConfig.inheritentce.createRequest().put(
//         Urls.updateUsers + newPost.id.toString(),
//         data:  {
//           "name" : newPost.name,
//           "phone" : newPost.phone,
//           "age" : newPost.age,
//           "gender" : newPost.gender,
//           "passport" : newPost.passport,
//           "familyMembers" : newPost.familyMembers,
//         }
//     );
//     Log.i(res.data.toString());
//     Log.i(res.statusCode.toString());
//
//     if(res.statusCode == 200 || res.statusCode == 201) {
//       return true;
//     } else {
//       Log.e('${res.statusMessage} ${res.statusCode}');
//       return false;
//     }
//   } on DioError catch (e) {
//     if(e.response != null) {
//       Log.e(e.response!.toString());
//       return false;
//     } else {
//       rethrow;
//     }
//   } catch (e) {
//     Log.e(e.toString());
//     return false;
//   }
//   // return null;
// }

// static Future<UserModel?> getUserById(int id) async {
//   try {
//     Response res = await DioConfig.inheritentce.createRequest().get(Urls.getSingleUsers + id.toString());
//     Log.i(res.data.toString());
//     Log.i(res.statusCode.toString());
//
//     if(res.statusCode == 200) {
//       UserModel user  = UserModel.fromJson(res.data);
//
//       return user;
//     } else {
//       Log.e('${res.statusMessage} ${res.statusCode}');
//     }
//   } on DioError catch (e) {
//     Log.e(e.toString());
//     if(e.response != null) {
//       Log.e(e.response!.toString());
//     } else {
//       rethrow;
//     }
//   } catch (e) {
//     Log.e(e.toString());
//
//   }
//   return null;
// }


//

//

//}

