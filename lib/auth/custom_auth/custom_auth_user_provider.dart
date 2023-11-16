import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class VigilantAuthUser {
  VigilantAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<VigilantAuthUser> vigilantAuthUserSubject =
    BehaviorSubject.seeded(VigilantAuthUser(loggedIn: false));
Stream<VigilantAuthUser> vigilantAuthUserStream() => vigilantAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
