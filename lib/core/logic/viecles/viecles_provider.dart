import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../models/viecle_model.dart';
import '../../utilities/api_path.dart';
import '../../utilities/dio_helper.dart';

class VieclesProvider extends ChangeNotifier {
  bool isAddViecle = false;
  bool isGetViecle = false;

  bool isAddTrailer = false;
  bool isGetTrailer = false;

  bool isAddTrailerType = false;
  bool isGetTrailerType = false;

  //add Viecle
  // Future<void> addViecle() async {
  //   isAddViecle = true;
  //   notifyListeners();
  //
  //   try {
  //     var response = await DioHelper.postData(
  //         url: '${AppApiPaths.base}/api/v1/viecles/',
  //         data: {
  //           "name": "v-three",
  //           "desc": "test v-one",
  //           "pic": "https://storage.googleapis.com/storage_buket_1/id.png"
  //         });
  //
  //     showToast(response.data['msg'], true, true);
  //
  //     isAddViecle = false;
  //     notifyListeners();
  //   } catch (error) {
  //     showToast(error.toString(), false, false);
  //     isAddViecle = false;
  //   }
  // }
  Viecle? selectedTruck;
  Viecle? selectedTrailer;
  Viecle? selectedTrailerType;
  ViecleTypes? selectedTruckType;
  void setTruck(Viecle truck) {
    selectedTruck = truck;
    notifyListeners();
  }

  void setTrailer(Viecle trailer) {
    selectedTrailer = trailer;
    notifyListeners();
  }

  void setTrailerType(Viecle trailerType) {
    selectedTrailerType = trailerType;
    notifyListeners();
  }

  void setTruckType(ViecleTypes truckType) {
    selectedTruckType = truckType;
    notifyListeners();
  }

  List<Viecle> viecles = [];
  //get viecle
  Future<void> getViecle() async {
    isGetViecle = true;
    viecles = [];
    notifyListeners();

    try {
      Response response = await DioHelper.getData(
        url: '${AppApiPaths.base}/api/v1/viecles/',
      );
      response.data.forEach((user) => viecles.add(Viecle.fromJson(user)));
      // print(viecles![0].sPic);
      // showToast(response['msg'], true, true);

      isGetViecle = false;
      notifyListeners();
    } catch (error) {
      showToast(error.toString(), false, false);
      isGetViecle = false;
    }
  }

  //add Trailer
  // Future<void> addTrailer() async {
  //   isAddTrailer = true;
  //   notifyListeners();
  //
  //   try {
  //     var response = await DioHelper.postData(
  //         url: '${AppApiPaths.base}/api/v1/viecles/Trailers',
  //         data: {
  //           "name": "t-one",
  //           "desc": "test t-one",
  //           "pic": "https://storage.googleapis.com/storage_buket_1/id.png"
  //         });
  //
  //     showToast(response.data['msg'], true, true);
  //
  //     isAddTrailer = false;
  //     notifyListeners();
  //   } catch (error) {
  //     showToast(error.toString(), false, false);
  //     isAddTrailer = false;
  //   }
  // }

  List<Viecle> trailers = [];
  //get Trailers
  Future<void> getTrailers() async {
    isGetTrailer = true;
    trailers = [];
    notifyListeners();
    try {
      Response response = await DioHelper.getData(
        url: '${AppApiPaths.base}/api/v1/viecles/Trailers',
      );
      response.data.forEach((e) => trailers.add(Viecle.fromJson(e)));

      isGetTrailer = false;
      notifyListeners();
    } catch (error) {
      // showToast(error.toString(), false, false);
      isGetTrailer = false;
    }
  }

  //add TrailerType
  // Future<void> addTrailerTypes() async {
  //   isAddTrailer = true;
  //   notifyListeners();
  //
  //   try {
  //     var response = await DioHelper.postData(
  //         url: '${AppApiPaths.base}/api/v1/viecles/TrailerTypes',
  //         data: {
  //           "name": "tt-one",
  //           "desc": "test v-one",
  //           "pic": "https://storage.googleapis.com/storage_buket_1/id.png"
  //         });
  //
  //     showToast(response.data['msg'], true, true);
  //
  //     isAddTrailer = false;
  //     notifyListeners();
  //   } catch (error) {
  //     showToast(error.toString(), false, false);
  //     isAddTrailer = false;
  //   }
  // }

  List<Viecle> trailersTypes = [];
  //get TrailersType
  Future<void> getTrailersTypes() async {
    trailersTypes = [];

    isGetTrailer = true;
    notifyListeners();

    try {
      Response response = await DioHelper.getData(
        url: '${AppApiPaths.base}/api/v1/viecles/TrailerTypes',
      );
      response.data.forEach((e) => trailersTypes.add(Viecle.fromJson(e)));
      print(response.data);
      // showToast(response['msg'], true, true);

      isGetTrailer = false;
      notifyListeners();
    } catch (error) {
      // showToast(error.toString(), false, false);
      isGetTrailer = false;
    }
  }

  List<ViecleTypes> vieclesTypes = [];
  //get TrailersType
  Future<void> getVieclesTypes() async {
    vieclesTypes = [];
    isGetTrailer = true;
    notifyListeners();

    try {
      Response response = await DioHelper.getData(
        url: '${AppApiPaths.base}/api/v1/viecles/type',
      );
      response.data.forEach((e) => vieclesTypes.add(ViecleTypes.fromJson(e)));
      print(response.data);
      // showToast(response['msg'], true, true);

      isGetTrailer = false;
      notifyListeners();
    } catch (error) {
      showToast(error.toString(), false, false);
      isGetTrailer = false;
    }
  }
}
