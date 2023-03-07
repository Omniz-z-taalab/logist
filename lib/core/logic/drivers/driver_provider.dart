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
   response.data.forEach((user) => driver!.add(DriversModel.fromJson(user)));
      print('wwwww');

      isAddViecle = true;
      getDetailsDriver();
      notifyListeners();
      print('wwwww');
    } catch (error) {
      // showToast(error.toString(), false, false);
      isAddViecle = false;
    }
  }

 DriverModel? driverModel ;
  Future<DriverModel?>getDetailsDriver({int? id}) async {
    try {
      var response =
      await DioHelper.getData(url:'${AppApiPaths.base}/api/v1/drivers//$id',
      );
      print(response.data);
      driverModel = DriverModel.fromJson(response.data);
      print(driverModel!.fullName);
       notifyListeners();
      print('wwwww');
    } catch (error) {
      print(error.toString());
       showToast(error.toString(), false, false);
    }
  }
}
