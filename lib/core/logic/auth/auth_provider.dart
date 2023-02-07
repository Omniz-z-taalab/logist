import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../local/cache_helper.dart';

import '../../utilities/api_service.dart';

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
      var response = await DioManager().post(
          '${AppApiPaths.base}/api/v1/auth/CheckIfUserExists',
          data: {"phonenumber": "+201277856368"},
          isAuth: false);
      print(response);
      isExist = response['already'];

      isLoading = false;
      notifyListeners();
      return isExist!;
    } catch (error) {
      isLoading = false;
      // notifyListeners();
      return isExist!;
    }
  }

  Future<bool> verifyUser({String? phoneNumber, key}) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await DioManager().post(
          '${AppApiPaths.base}/api/v1/auth/VerifyNumber',
          data: {"phonenumber": "+201277856368", "key": key},
          isAuth: false);
      print(response);
      isVerify = response['Verified'];
      if (!isVerify) {
        showToast("الرمز غير صحيح", true, false);
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

  Future<bool> respondOtp({String? phoneNumber}) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await DioManager().post(
          '${AppApiPaths.base}/api/v1/auth/Verify',
          data: {"phonenumber": "+201277856368"},
          isAuth: false);
      print(response);
      isExist = response;

      isLoading = false;
      notifyListeners();
      return isExist!;
    } catch (error) {
      isLoading = false;
      // notifyListeners();
      return isExist!;
    }
  }

  Future<bool> registerUser() async {
    isLoading = true;
    notifyListeners();

    try {
      var response =
          await DioManager().post('${AppApiPaths.base}/api/v1/auth/regester',
              data: {
                "FullName": _name ?? '',
                "phonenumber": _phone ?? '',
                "adrress": _address ?? "26st el-mostshfa shubra",
                "email": _email ?? "test@test.com"
              },
              isAuth: false);
      print(response);

      CacheHelper.putData(key: 'accessToken', value: response['accesToken']);

      isLoading = false;
      notifyListeners();
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

    try {
      var response = await DioManager().post('${AppApiPaths.base}/api/v1/auth/',
          data: {"phonenumber": "+201277856368", "key": key}, isAuth: false);
      // print(response);
      // isVerify = response['Verified'];
      if (response['accesToken'] != null) {
        CacheHelper.putData(key: 'accessToken', value: response['accesToken']);
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
  Future<bool> registerDriver({DriverModel? driverModel}) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await DioManager()
          .post('${AppApiPaths.base}/api/v1/auth/driverRegester',
              data: {
                "FullName": "test driver",
                "phonenumber": "+201098032881",
                "adrress": "26st el-mostshfa shubra",
                "email": "drivder@test.com",
                "nationality": "Egypt",
                "identity_card": "12345678901",
                "license": "first class",
                "vehicle_register_number": "0123456",
                "plate_number": "ارج 1234",
                "identity_card_photo_front":
                    "https://storage.googleapis.com/storage_buket_1/id.png",
                "identity_card_photo_back":
                    "https://storage.googleapis.com/storage_buket_1/id.png",
                "lecense_photo":
                    "https://storage.googleapis.com/storage_buket_1/id.png",
                "vehicle_type_id": 1,
                "TrailerIds": 2,
                "TrailerTypeIds": 3
              },
              isAuth: false);
      print(response);

      CacheHelper.putData(key: 'accessToken', value: response['accesToken']);

      isLoading = false;
      notifyListeners();
      return isVerify;
    } catch (error) {
      showToast(error.toString(), true, false);
      isLoading = false;
      // notifyListeners();
      return isVerify;
    }
  }
}
