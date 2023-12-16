import 'dart:convert';

import 'package:banking_app/data/models/wallet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String key = 'wallet_data';

  // Сохранение WalletModel в SharedPreferences
  static Future<bool> saveWalletModelToPrefs(WalletModel data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonData =
        json.encode(data.toJson()); // Преобразовать WalletModel в JSON-строку
    return prefs.setString(key, jsonData);
  }

  // Получение WalletModel из SharedPreferences
  static Future<WalletModel?> getWalletModelFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.clear();
    String? jsonData = prefs.getString(key);
    if (jsonData != null) {
      Map<String, dynamic> dataMap = json.decode(jsonData);
      return WalletModel.fromJson(dataMap);
    } else {
      return null;
    }
  }

  // Обновление WalletModel в SharedPreferences
  static Future<void> updateWalletModelInPrefs(
      WalletModel walletChanges) async {
    // Загрузить существующие данные из SharedPreferences
    WalletModel? existingData = await getWalletModelFromPrefs();

    // Если существующие данные есть, обновить их изменениями
    if (existingData != null) {
      existingData.categories = walletChanges.categories;
      await saveWalletModelToPrefs(existingData);
    }
  }
}
