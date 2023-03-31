import 'package:flutter/cupertino.dart';

import '../../../models/driver_model.dart';
import '../../utilities/api_path.dart';
import '../../utilities/dio_helper.dart';

class DriversProvider extends ChangeNotifier {
  bool isGetFillterDriver = false;
  List<DriversModel> driver = [];

  Future<void> getAllDrivers({
    var vehicleId,
    var vehicleTypeId,
    var trailerTypeId,
    var trailerId,
  }) async {
    isGetFillterDriver = true;
    notifyListeners();
    driver = [];
    try {
      var response = await DioHelper.getData(
        url:
            '${AppApiPaths.base}/api/v1/drivers?status=online&verified=verified&vehicle_type_id=$vehicleTypeId&vehicle_id=$vehicleId&trailler_id=$trailerId&trailler_type_id=$trailerTypeId',
      );
      print(response.data);
      response.data.forEach((user) => driver.add(DriversModel.fromJson(user)));

      isGetFillterDriver = false;
      notifyListeners();
    } catch (error) {
      print(error);
      // showToast(error.toString(), false, false);
      isGetFillterDriver = false;
    }
  }

  bool load = false;
  DriversModel? driverModel;

  Future<DriversModel?> getDetailsDriver({int? id}) async {
    load = true;
    try {
      var response = await DioHelper.getData(
        url: '${AppApiPaths.base}/api/v1/drivers/$id',
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
