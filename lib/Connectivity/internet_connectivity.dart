import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class InternetConnectivity {
  final Connectivity connectivity = Connectivity();
  ConnectivityResult connectionStatus = ConnectivityResult.none;
}
