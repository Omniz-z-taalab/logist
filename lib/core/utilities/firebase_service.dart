// import 'dart:async';
//
// import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
//
// abstract class BaseAuth {
//   Future<User> currentUser();
//   Future<User> signIn(String email, String password);
//   Future<User> createUser(String email, String password);
//   Future<void> signOut();
//   // Future<User> signInWithGoogle();
//   // Future<User> signInWithFacebook();
//   Future<void> updateEMail(String newEmail);
//   Future<void> updatePhoto(String newUrlPhoto);
//   Future<void> sendVerificationEmail();
//   Future<void> sendPasswordResetEmail(String email);
// }
//
// class Auth implements BaseAuth {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//
//   @override
//   Future<User> signIn(String email, String password) async {
//     UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
//         email: email, password: password);
//     return user.user!;
//   }
//
//   @override
//   Future<User> createUser(String email, String password) async {
//     UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
//         email: email, password: password);
//     return user.user!;
//   }
//
// //Get a user's edit_profile
//   @override
//   Future<User> currentUser() async {
//     User? user = _firebaseAuth.currentUser;
//     return user!;
//   }
//
//   @override
//   Future<void> signOut() async {
//     return _firebaseAuth.signOut();
//   }
//
//   // @override
//   // Future<User> signInWithGoogle() async {
//   //   // Trigger the authentication flow
//   //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//   //   // Obtain the auth details from the request
//   //   final GoogleSignInAuthentication? googleAuth =
//   //       await googleUser?.authentication;
//   //
//   //   // Create a new credential
//   //   final credential = GoogleAuthProvider.credential(
//   //     accessToken: googleAuth?.accessToken,
//   //     idToken: googleAuth?.idToken,
//   //   );
//   //   UserCredential user =
//   //       await _firebaseAuth.signInWithCredential(credential);
//   //
//   //   return user.user!;
//   // }
//   //
//   // @override
//   // Future<User> signInWithFacebook() async {
//   //   // Trigger the sign-in flow
//   //   final LoginResult loginResult = await FacebookAuth.instance.login();
//   //   // Create a credential from the access token
//   //   final OAuthCredential facebookAuthCredential =
//   //       FacebookAuthProvider.credential(loginResult.accessToken!.token);
//   //   UserCredential user = await _firebaseAuth
//   //       .signInWithCredential(facebookAuthCredential);
//   //   // Once signed in, return the UserCredential
//   //   return user.user!;
//   // }
//
//   @override
//   Future<void> updateEMail(String newEmail) async {
//     User user = await currentUser();
//    await  user.updateEmail(newEmail);
//   }
//
//   @override
//   Future<void> updatePhoto(String newUrlPhoto)async {
//     User user = await currentUser();
//     await user.updateEmail(newUrlPhoto);
//   }
//
//   @override
//   Future<void> sendVerificationEmail()async {
//      User user = await currentUser();
//     await user.sendEmailVerification();
//   }
//
//   @override
//   Future<void> sendPasswordResetEmail(String email)async {
//     await _firebaseAuth
//     .sendPasswordResetEmail(email: email);
//   }
// }
