import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../local/cache_helper.dart';

import '../../utilities/dio_helper.dart';

import '../../../models/driver_model.dart';
import '../../utilities/api_path.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  bool? isExist = false;
  bool isVerify = false;
  String? _name;
  String? _address;
  String? _email;
  String? _phone;

  void setName(String nameUser) {
    _name = nameUser;
  }

  void setPhone(String phoneUser) {
    _phone = phoneUser;
  }

  void setEmail(String emailUser) {
    _email = emailUser;
  }

  void setAddress(String addressUser) {
    _address = addressUser;
  }

  //userExists//
  Future<bool> existsUser({String? phoneNumber}) async {
    isLoading = true;
    notifyListeners();
    try {
      Response response = await DioHelper.postData(
        url: '/api/v1/auth/CheckIfUserExists',
        data: {"phonenumber": phoneNumber},
      );
      print(response);
      isExist = response.data['already'];
      CacheHelper.putData(
          key: "REQUEST_ID", value: response.data['REQUEST_ID']);

      isLoading = false;
      notifyListeners();
      return isExist!;
    } catch (error) {
      print(error);
      isLoading = false;
      notifyListeners();
      return isExist!;
    }
  }

  Future<bool> verifyUser({String? phoneNumber, key}) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await DioHelper.postData(
        url: '/api/v1/auth/VerifyNumber',
        data: {
          "phonenumber": phoneNumber,
          "key": key,
          "REQUEST_ID": CacheHelper.getData(key: "REQUEST_ID")
        },
      );
      print(response);
      isVerify = response.data['Verified'];
      print(response.data['accesToken']);

      print('777777777');
      if (!isVerify) {
        showToast("الرمز غير صحيح", true, false);
      }
      isLoading = false;
      notifyListeners();
      return isVerify;
    } catch (error) {
      print(error);
      isLoading = false;
      // notifyListeners();
      return isVerify;
    }
  }

  Future<bool> respondOtp({String? phoneNumber}) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await DioHelper.postData(
        url: '${AppApiPaths.base}/api/v1/auth/Verify',
        data: {"phonenumber": phoneNumber},
      );
      print(response);
      isExist = response.data;
      String? tokeeeeeeeen = CacheHelper.getData(key: 'accesToken');
      print(tokeeeeeeeen);
      print(tokeeeeeeeen);
      print('tokeeeeeeeeeeeeeeeeeeeeeeeeeen is');
      isLoading = false;
      notifyListeners();
      return isExist!;
    } catch (error) {
      isLoading = false;
      // notifyListeners();
      return isExist!;
    }
  }

  registerModel? model;

  Future<bool> registerUser(
      String? address, String? email, String? name, String? phone) async {
    print('----------------------------------------------------------------');
    isLoading = true;
    notifyListeners();

    try {
      var response = await DioHelper.postData(
        url: '${AppApiPaths.base}/api/v1/auth/regester',
        data: {
          "FullName": name,
          "phonenumber": "$phone",
          "adrress": address,
          "email": email
        },
      );
      model = registerModel.fromJson(response.data);
      if (model!.accesToken == null) {
        showToast('غير صحيح', true, false);
      } else {
        CacheHelper.putData(
            key: 'accessToken', value: response.data['accesToken']);
        isLoading = false;

        notifyListeners();
      }
      return isVerify;
    } catch (error) {
      showToast(error.toString(), true, false);
      isLoading = false;
      // notifyListeners();
      return isVerify;
    }
  }

  Future<bool> loginUser({String? phoneNumber, key}) async {
    isLoading = true;
    notifyListeners();
    print('userrrrr');
    try {
      var response = await DioHelper.postData(
          url: '${AppApiPaths.base}/api/v1/auth/',
          data: {
            "phonenumber": phoneNumber,
            "key": key,
            "REQUEST_ID": CacheHelper.getData(key: "REQUEST_ID")
          });
      print(response);
      print('true');
      // isVerify = response['Verified'];
      if (response.data['accesToken'] != null) {
        CacheHelper.putData(
            key: 'accessToken', value: response.data['accesToken']);
        isVerify = true;
      } else {
        isVerify = false;
      }

      isLoading = false;
      notifyListeners();
      return isVerify;
    } catch (error) {
      isLoading = false;
      // notifyListeners();
      return isVerify;
    }
  }

//registerDriver
}

class registerModel {
  String? accesToken;
  String? refreshToken;

  registerModel({this.accesToken, this.refreshToken});

  registerModel.fromJson(Map<String, dynamic> json) {
    accesToken = json['accesToken'];
    refreshToken = json['RefreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accesToken'] = this.accesToken;
    data['RefreshToken'] = this.refreshToken;
    return data;
  }
}
