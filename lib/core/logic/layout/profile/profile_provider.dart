import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../models/user_model.dart';

import '../../../local/cache_helper.dart';
import '../../../utilities/api_path.dart';
import '../../../utilities/api_service.dart';

class ProfileProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isLoadingFile = false;
  bool? isExist = false;
  UserModel? userModel;
    String? name;

  Future<void> updateUser(UserModel userModel) async {
    isLoading = true;
    notifyListeners();

    try {
      var response =
          await DioManager().post('${AppApiPaths.base}/api/v1/user/', data: {
        "FullName": userModel.fullName ?? "",
        "phonenumber": userModel.phoneNumber,
        "adrress": userModel.adrress,
        "email": userModel.email
      });
      // print(response);
      userModel = UserModel.fromJson(response);
      showToast("تم تعديل بنجاج", true, true);
      // getUser();

      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      // notifyListeners();
      // return isExist!;
    }
  }

  Future<void> getUser() async {
    isLoading = true;
    notifyListeners();

    try {
      String? token = CacheHelper.getData(key:'accessToken');
      print(token);
      var response = await DioManager().get(
        '${AppApiPaths.base}/api/v1/user/',
      );
       print(response);
       print('3333333333333333');
       print(token);
       print('3333332222222');
      userModel = UserModel.fromJson(response);
      isLoading = false;
        name = userModel!.fullName;
      notifyListeners();
    } catch (error) {
      isLoading = false;
      // notifyListeners();
      // return isExist!;
    }
  }

  Future<String> uploadDocs({File? file}) async {
    isLoadingFile = true;
    notifyListeners();

    // try {
    var response = await DioManager().uploadFiles(
        '${AppApiPaths.base}/api/v1/auth/UploadDocument',
        file: file!);
    print(response);
    return response['url'];
    // userModel = UserModel.fromJson(json.decode(response));

    //   isLoadingFile = false;
    //   notifyListeners();
    // } catch (error) {
    //   isLoadingFile = false;
    //   // notifyListeners();
    //   // return isExist!;
    // }
  }
}
