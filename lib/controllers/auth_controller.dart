import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:krishna_electronics/controllers/firestore_controller.dart';
import 'package:krishna_electronics/models/user_model.dart';
import 'package:krishna_electronics/utilities/constants.dart';

class AuthController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirestoreController _firestoreController = FirestoreController();

  // SIGN UP METHOD
  Future<String> signUpUser({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    String result = 'Something went wrong!';
    name.trim();
    email.trim();
    password.trim();
    phoneNumber.trim();
    if (name.isNotEmpty &&
        name != '' &&
        email.isNotEmpty &&
        email != '' &&
        password.isNotEmpty &&
        password != '' &&
        phoneNumber.isNotEmpty &&
        phoneNumber != '') {
      // proceed to sign-up
      try {
        await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        UserModel userModel = UserModel(
          name: name,
          email: email,
          uid: _auth.currentUser!.uid,
          isAdmin: false,
          isVerified: false,
        );
        await _firestoreController.uploadUserDetails(userModel: userModel);
        result = C.success;
      } on FirebaseAuthException catch (e) {
        result = e.message.toString();
        log('Firebase exception in AuthControllers.signUp() $result');
      } catch (e) {
        log('Catch block in AuthControllers.signUp() ${e.toString()}');
      }
    } else {
      // show the error to type all the fields
      result = 'Please enter all the fields';
      log('Else block in AuthControllers.signUp()');
    }
    return result;
  }

  //SIGN IN METHOD
  Future<String> signIn({
    required String email,
    required String password,
  }) async {
    String result = 'Something went wrong!';
    email.trim();
    password.trim();
    if (email.isNotEmpty &&
        email != '' &&
        password.isNotEmpty &&
        password != '') {
      try {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        result = C.success;
      } on FirebaseAuthException catch (e) {
        result = e.message.toString();
        log('Firebase exception in AuthControllers.signIn() $result');
      } catch (e) {
        log('Catch block in AuthControllers.signIn() ${e.toString()}');
      }
    } else {
      result = 'Please enter all the fields';
      log('Else block in AuthControllers.signIn()');
    }
    return result;
  }
}
