import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _viewProfileDropdown = ['Block', 'Report'];
  List<String> get viewProfileDropdown => _viewProfileDropdown;
  set viewProfileDropdown(List<String> _value) {
    _viewProfileDropdown = _value;
  }

  void addToViewProfileDropdown(String _value) {
    _viewProfileDropdown.add(_value);
  }

  void removeFromViewProfileDropdown(String _value) {
    _viewProfileDropdown.remove(_value);
  }

  String _dropdownSelection = '';
  String get dropdownSelection => _dropdownSelection;
  set dropdownSelection(String _value) {
    _dropdownSelection = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
