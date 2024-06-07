import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;

  static const _userId = 'userId';
  static const _hasDcAccess = 'has_dc_access';
  static const _userName = 'user_name';
  static const _authType = 'auth_type';
  static const _authToken = 'authToken';
  static const _userType = 'user_type';
  static const _profilePic = 'profile_pic';
  static const _language = 'language';
  static const _selected = 'selected';
  static const _hasRegistered = 'hasRegistered';
  static const _referral = 'referral';
  static const _mandiState = '_mandiState';
  static const _sellerId = "_sellerId";
  static const _selectedKisaanStation = 'selectedKisaanStation';
  static const _sellerType = "sellerType";
  static const _mobileNo = "mobileNo";

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUser(
      {String? userId,
      String? authToken,
      String? authType,
      String? sellerId,
      List<String>? hasDcAccess,
      String? mobileNo}) async {
    await _preferences.setString(_userId, userId ?? "");
    await _preferences.setStringList(_hasDcAccess, hasDcAccess ?? []);
    await _preferences.setString(_authToken, authToken ?? "");
    await _preferences.setString(_authType, authType ?? "");
    await _preferences.setString(_sellerId, sellerId ?? "");
    await _preferences.setString(_mobileNo, mobileNo ?? "");
  }

  static Future setUserType(String? userType) async {
    await _preferences.setString(_userType, userType ?? "");
  }

  static Future setUserName(String? userName) async {
    await _preferences.setString(_userName, userName ?? "");
  }

  static Future setProfilePic(String profilePic) async {
    await _preferences.setString(_profilePic, profilePic);
  }

  static Future setLanguage(String? lang) async {
    await _preferences.setString(_language, lang ?? 'en');
  }

  static Future setLangSelect({required bool select}) async {
    await _preferences.setBool(_selected, select);
  }

  static Future setRegistered({required bool registered}) async {
    await _preferences.setBool(_hasRegistered, registered);
  }

  static Future setReferral(String referral) async {
    await _preferences.setString(_referral, referral);
  }

  static Future setMandiState(String mandiState) async {
    await _preferences.setString(_mandiState, mandiState);
  }

  static Future setSelectedKisaanStation(String mandiState) async {
    await _preferences.setString(_mandiState, mandiState);
  }

  static Future setSeller(String sellerId) async {
    await _preferences.setString(_sellerId, sellerId);
  }

  static Future setSellerType(String sellerType) async {
    await _preferences.setString(_sellerType, sellerType);
  }

  static String get userId => _preferences.getString(_userId) ?? "";

  static List<String> get hasDcAccess =>
      _preferences.getStringList(_hasDcAccess) ?? [];

  static String get sellerId => _preferences.getString(_sellerId) ?? "";

  static String get sellerType => _preferences.getString(_sellerType) ?? "";

  static String get userName => _preferences.getString(_userName) ?? "";

  static String get userType => _preferences.getString(_userType) ?? "";

  static String get authType => _preferences.getString(_authType) ?? "";

  static String get authToken => _preferences.getString(_authToken) ?? "";

  static String? get profilePic => _preferences.getString(_profilePic);

  static String get language => _preferences.getString(_language) ?? "en";

  static bool get languageSelected => _preferences.getBool(_selected) ?? false;

  static String get referral => _preferences.getString(_referral) ?? "";

  static String get mobileNo => _preferences.getString(_mobileNo) ?? "";
  static String get mandiState =>
      _preferences.getString(_mandiState) ?? "Bihar";

  static bool get hasRegistered =>
      _preferences.getBool(_hasRegistered) ?? false;

  static Future removeProfile() async {
    await _preferences.remove(_profilePic);
  }

  static Future removeReferral() async {
    await _preferences.remove(_referral);
  }

  static Future removeUser() async {
    await _preferences.remove(_userId);
    await _preferences.remove(_mobileNo);
    await _preferences.remove(_hasDcAccess);
    await _preferences.remove(_userName);
    await _preferences.remove(_userType);
    await _preferences.remove(_authType);
    await _preferences.remove(_authToken);
    await _preferences.remove(_profilePic);
    await _preferences.remove(_hasRegistered);
    await _preferences.remove(_sellerId);
    await _preferences.remove(_sellerType);
  }
}
