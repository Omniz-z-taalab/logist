class AppApiPaths {
  static const String base = "https://logist8768.herokuapp.com";
  static const String auth = '$base/api/v1/auth';
  static const String customer = '$base/customer';
  static const String subscribe = '$customer/subscribe';
  static const String config = '$base/config';
  static const String restaurants = '$base/restaurants';
  static const String packages = '$base/packages';

  //auth
  static const String login = '$auth/login';
  static const String register = '$auth/register';
  static const String verifyPhone = '$auth/verify-phone';
  static const String logout = '$auth/logout';
  static const String forgotPassword = '$auth/forgot-password';
  static const String verifyToken = '$auth/verify-token';
  static const String resetPassword = '$auth/reset-password?_method=PUT';
  static const String socialRegister = '$auth/social-register';
  static const String socialLogin = '$auth/social-login';
  static const String addPhone = '$auth/add-phone';

  //location
  static const String getAllZone = '$config/all-zone';
  static const String getZoneById = '$config/get-zone-id';

  //profile
  static const String profileInfo = '$customer/info';
  static const String updateProfileInfo =
      'https://logist99.herokuapp.com/customer/update-profile';
  static const String updateAddress = '$customer/address/update/';
  static const String addNewAddress = '$customer/address/add';
  static const String deleteAddress = '$customer/address/delete?_method=DELETE';
  static const String addressList = '$customer/address/list';
  static const String updateZone = '$customer/update-zone';
  static const String favList = '$customer/my_wishlist';

  //home
  static const String home = '$base/';
  //restaurant
  static const String allRestaurants = '$restaurants/get-restaurants';
  static const String restaurantsDetails = '$restaurants/details/';
  static const String search = '$restaurants/search';
  static const String wishlist = '$restaurants/wishlist/';

  //packages
  static const String packagesWishlist = '$packages/wishlist/';
  static const String packagesReview = '$packages/reviews/submit';

  //subscribe
  static const String subscribePlace = '$subscribe/place';
  static const String subscribeUpdate = '$subscribe/update';
  static const String subscribeList = '$subscribe/list';
  static const String subscribeDetails = '$subscribe/details/';

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };
}
