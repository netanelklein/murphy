import 'dart:async';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';
import 'models/beer.dart';

class AppState extends ChangeNotifier {
  AppState() {
    init();
  }

  String _uid = '';
  String get uid => _uid;

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  bool _isAdmin = false;
  bool get isAdmin => _isAdmin;

  StreamSubscription<QuerySnapshot>? _beerStream;
  List<Beer> _beerList = [];
  List<Beer> get beerList => _beerList;

  Future<void> init() async {
    // Initialize Firebase
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    // Listen for auth changes
    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
      GoogleProvider(
          clientId:
              '988689625010-pmq9ra9bqb71i1p4to0t631erblpgr45.apps.googleusercontent.com')
    ]);

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;
        _uid = user.uid;
      } else {
        _loggedIn = false;
        _uid = '';
      }
      notifyListeners();
    });

    // Listen for admin changes
    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get()
            .then((doc) {
          _isAdmin = doc.data()!['isAdmin'];
          notifyListeners();
        });
      } else {
        _isAdmin = false;
        notifyListeners();
      }
    });

    // Listen for beer changes
    _beerStream = FirebaseFirestore.instance
        .collection('beers')
        .snapshots()
        .listen((snapshot) {
      _beerList = snapshot.docs.map((doc) => Beer.fromMap(doc.data())).toList();
      notifyListeners();
    });
  }
}
