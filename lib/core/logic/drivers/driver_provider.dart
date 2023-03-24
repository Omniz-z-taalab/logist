import 'package:flutter/cupertino.dart';

import '../../../models/driver_model.dart';
import '../../utilities/api_path.dart';
import '../../utilities/dio_helper.dart';

class DriversProvider extends ChangeNotifier {
bool  isAddViecle = false;
List<DriversModel> driver = [];
  Future<void> getAllDrivers() async {
    isAddViecle = true;
    notifyListeners();
    driver = [];
    try {
      var response =
      await DioHelper.getData(url:'${AppApiPaths.base}/api/v1/drivers?status=online',
      );
      print(response.data);
   response.data.forEach((user) => driver .add(DriversModel.fromJson(user)));

      isAddViecle = true;
      notifyListeners();
     } catch (error) {
      showToast(error.toString(), false, false);
      isAddViecle = false;
    }
  }
bool load = false;
DriversModel? driverModel ;
  Future<DriversModel?>getDetailsDriver({int? id}) async {
    load = true;
    try {
       var response =
      await DioHelper.getData(url:'${AppApiPaths.base}/api/v1/drivers/$id',
      );
       print(response.data);
      driverModel = DriversModel.fromJson(response.data);
      load = true;
      print(driverModel!.fullName);
       notifyListeners();
     } catch (error) {
      print(error.toString());
       showToast(error.toString(), false, false);
    }
  }
}
