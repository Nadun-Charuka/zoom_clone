import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static bool isInitialize = false;

  static Future<void> initSignIn() async {
    if (!isInitialize) {
      await _googleSignIn.initialize(
        serverClientId:
            "573885473144-ruoojgi4l6m2nigtfnnmqcegr6ciuihf.apps.googleusercontent.com",
      );
    }
    isInitialize = true;
  }

  static Future<UserCredential?> signInWithGoogle() async {
    try {
      initSignIn();
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
      final idToken = googleUser.authentication.idToken;
      final authorizationClient = googleUser.authorizationClient;
      GoogleSignInClientAuthorization? authorization = await authorizationClient
          .authorizationForScopes([
            'email',
            'profile',
          ]);

      final accessToken = authorization?.accessToken;

      if (accessToken == null) {
        final authorization2 = await authorizationClient.authorizationForScopes(
          [
            'email',
            'profile',
          ],
        );

        if (authorization2?.accessToken == null) {
          throw FirebaseAuthException(
            code: "error",
            message: "error in authorization2 access token",
          );
        }
        authorization = authorization2;
      }
      final credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      final User? user = userCredential.user;
      if (user != null) {
        final userDoc = FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid);
        final docSnapshot = await userDoc.get();
        if (!docSnapshot.exists) {
          await userDoc.set({
            "uid": user.uid,
            "name": user.displayName,
            'email': user.email,
            'photoUrl': user.photoURL,
            'provider': 'google',
            'createdAt': FieldValue.serverTimestamp(),
          });
        }
      }
      return userCredential;
    } catch (e) {
      debugPrint("error in google sign in auth");
      rethrow;
    }
  }

  static User? get currentUser => _auth.currentUser;

  static Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      debugPrint("error in google sign out");
      rethrow;
    }
  }
}
