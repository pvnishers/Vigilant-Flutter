import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCHfmHF9lxgEyq-5vEwa_JQxVgeKZEhke8",
            authDomain: "vigilantcore-6943e.firebaseapp.com",
            projectId: "vigilantcore-6943e",
            storageBucket: "vigilantcore-6943e.appspot.com",
            messagingSenderId: "1007578909146",
            appId: "1:1007578909146:web:46846c9b72ff1025bf98e3",
            measurementId: "G-NYV9CRHV31"));
  } else {
    await Firebase.initializeApp();
  }
}
