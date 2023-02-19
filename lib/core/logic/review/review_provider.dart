import 'package:flutter/foundation.dart';
import '../../utilities/dio_helper.dart';

import '../../../models/review.dart';
import '../../utilities/api_path.dart';

class ReviewProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isAddLoading = false;
  Review? review;
  //get Review
  Future<void> getReview({int? driverId}) async {
    isLoading = true;
    notifyListeners();

    try {
      var response = await DioHelper.getData(

        url:  '${AppApiPaths.base}/api/v1/review/Reviews',
          data: {"DriverId": 3});
      review = Review.fromJson(response.data);

      isLoading = false;
      notifyListeners();
    } catch (error) {
      isLoading = false;
    }
  }

  //add review
  Future<void> addReview({int? driverId, rate}) async {
    isAddLoading = true;
    notifyListeners();

    try {
      var response = await DioHelper.postData(

        url:'${AppApiPaths.base}/api/v1/review/AddReview',
          data: {"DriverId": 3, "Rating": 4});
      // review = Review.fromJson(response);
      if (response.data['review_id'] != null) {
        showToast("Success", true, true);
      }

      isAddLoading = false;
      notifyListeners();
    } catch (error) {
      isAddLoading = false;
    }
  }
}
