import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import '../../../../models/user_model.dart';

import '../../../local/cache_helper.dart';
import '../../../utilities/api_path.dart';
import '../../../utilities/dio_helper.dart';

class ProfileProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isLoadingFile = false;
  bool? isExist = false;
  UserModel? userModel;
    String? name;

  Future<void> updateUser(UserModel userModel) async {
    isLoading = true;
    notifyListeners();
    print('4444444444444444444');
    print(userModel!.fullName);

    try {
      var response =
          await DioHelper.postData(url:'/api/v1/user/',
              data: {
        "FullName": userModel.fullName ,
        "phonenumber": userModel.phoneNumber,
        "adrress": userModel.adrress,
        "email": userModel.email
      });
      print('6666666666666');
      print(response);
      userModel = UserModel.fromJson(response.data);
      showToast("تم تعديل بنجاج", true, true);
       getUser();

      isLoading = false;
      notifyListeners();
    } catch (error) {

      isLoading = false;
      showToast("حدث خطآ حاول مره اخري", true, false);

      // notifyListeners();
      // return isExist!;
    }
  }

  Future<void> getUser() async {
    isLoading = true;
    // notifyListeners();
    print('555555555555555');
    try {
      var response = await DioHelper.getData(url:'${AppApiPaths.base}/api/v1/user/',
      );

      userModel = UserModel.fromJson(response.data);
      isLoading = false;

      print(userModel!.id);
        name = userModel!.fullName;
      notifyListeners();
    } catch (error) {
      print(error);
      isLoading = false;
      // notifyListeners();
      // return isExist!;
    }
  }

  // Future<String> uploadDocs({File? file}) async {
  //   isLoadingFile = true;
  //   notifyListeners();
  //
  //   // try {
  //   var response = await DioManager().uploadFiles(
  //       '${AppApiPaths.base}/api/v1/auth/UploadDocument',
  //       file: file!);
  //   print(response);
  //   return response['url'];
  //   // userModel = UserModel.fromJson(json.decode(response));
  //
  //   //   isLoadingFile = false;
  //   //   notifyListeners();
  //   // } catch (error) {
  //   //   isLoadingFile = false;
  //   //   // notifyListeners();
  //   //   // return isExist!;
  //   // }
  // }
}
