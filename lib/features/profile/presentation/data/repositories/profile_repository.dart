import '../../../../../core/database/local_database_service.dart';
import '../models/currency_option_model.dart';
import '../models/profile_model.dart';

class ProfileRepository {
  final LocalDatabaseService _databaseService = LocalDatabaseService.instance;

  Future<ProfileModel> getProfile() async {
    final db = await _databaseService.database;

    final result = await db.query(
      'profile',
      where: 'id = ?',
      whereArgs: [1],
      limit: 1,
    );

    if (result.isEmpty) {
      final defaultProfile = ProfileModel.defaultProfile();

      await db.insert(
        'profile',
        defaultProfile.toMap(),
      );

      return defaultProfile;
    }

    return ProfileModel.fromMap(result.first);
  }

  Future<void> updateMonthlyBudget(double monthlyBudget) async {
    final db = await _databaseService.database;

    await db.update(
      'profile',
      {
        'monthlyBudget': monthlyBudget,
        'updatedAt': DateTime.now().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [1],
    );
  }

  Future<void> updateCurrency(CurrencyOptionModel currency) async {
    final db = await _databaseService.database;

    await db.update(
      'profile',
      {
        'currencyCode': currency.code,
        'currencyName': currency.name,
        'currencySymbol': currency.symbol,
        'updatedAt': DateTime.now().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [1],
    );
  }
}