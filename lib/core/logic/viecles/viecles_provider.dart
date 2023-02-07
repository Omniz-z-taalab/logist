import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../utilities/api_service.dart';

import '../../../models/viecle_model.dart';
import '../../utilities/api_path.dart';

class VieclesProvider extends ChangeNotifier {
  bool isAddViecle = false;
  bool isGetViecle = false;

  bool isAddTrailer = false;
  bool isGetTrailer = false;

  bool isAddTrailerType = false;
  bool isGetTrailerType = false;

  //add Viecle
  Future<void> addViecle() async {
    isAddViecle = true;
    notifyListeners();

    try {
      var response =
          await DioManager().post('${AppApiPaths.base}/api/v1/viecles/', data: {
        "name": "v-three",
        "desc": "test v-one",
        "pic": "https://storage.googleapis.com/storage_buket_1/id.png"
      });

      showToast(response['msg'], true, true);

      isAddViecle = false;
      notifyListeners();
    } catch (error) {
      showToast(error.toString(), false, false);
      isAddViecle = false;
    }
  }

  List<Viecle> viecles = [];
  //get viecle
  Future<void> getViecle() async {
    isGetViecle = true;
    notifyListeners();

    try {
      Response response = await DioManager().get(
        '${AppApiPaths.base}/api/v1/viecles/',
      );
      // viecles=(response.data as List<dynamic>).map((e){Viecle.fromJson(e)}).toList();
      print(response.data);
      // showToast(response['msg'], true, true);

      isGetViecle = false;
      notifyListeners();
    } catch (error) {
      showToast(error.toString(), false, false);
      isGetViecle = false;
    }
  }

  //add Trailer
  Future<void> addTrailer() async {
    isAddTrailer = true;
    notifyListeners();

    try {
      var response = await DioManager()
          .post('${AppApiPaths.base}/api/v1/viecles/Trailers', data: {
        "name": "t-one",
        "desc": "test t-one",
        "pic": "https://storage.googleapis.com/storage_buket_1/id.png"
      });

      showToast(response['msg'], true, true);

      isAddTrailer = false;
      notifyListeners();
    } catch (error) {
      showToast(error.toString(), false, false);
      isAddTrailer = false;
    }
  }

  List<Viecle> trailers = [];
  //get Trailers
  Future<void> getTrailers() async {
    isGetTrailer = true;
    notifyListeners();

    try {
      Response response = await DioManager().get(
        '${AppApiPaths.base}/api/v1/viecles/Trailers',
      );
      // viecles=(response.data as List<dynamic>).map((e){Viecle.fromJson(e)}).toList();
      print(response.data);
      // showToast(response['msg'], true, true);

      isGetTrailer = false;
      notifyListeners();
    } catch (error) {
      showToast(error.toString(), false, false);
      isGetTrailer = false;
    }
  }

  //add TrailerType
  Future<void> addTrailerTypes() async {
    isAddTrailer = true;
    notifyListeners();

    try {
      var response = await DioManager()
          .post('${AppApiPaths.base}/api/v1/viecles/TrailerTypes', data: {
        "name": "tt-one",
        "desc": "test v-one",
        "pic": "https://storage.googleapis.com/storage_buket_1/id.png"
      });

      showToast(response['msg'], true, true);

      isAddTrailer = false;
      notifyListeners();
    } catch (error) {
      showToast(error.toString(), false, false);
      isAddTrailer = false;
    }
  }

  List<Viecle> trailersTypes = [];
  //get TrailersType
  Future<void> getTrailersTypes() async {
    isGetTrailer = true;
    notifyListeners();

    try {
      Response response = await DioManager().get(
        '${AppApiPaths.base}/api/v1/viecles/TrailerTypes?name=tt-three',
      );
      // viecles=(response.data as List<dynamic>).map((e){Viecle.fromJson(e)}).toList();
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
