import 'package:hive/hive.dart';
import 'package:projectname_flutter_mobile/infrastructure/repository/db_repository.dart';

class LocalDataProvider {

  final Box<dynamic> _box = DBRepository().box;

  Future<int> fetchBalance() async {
    return await _box.get('balance') ?? 0;
  }

  Future<void> saveBalance(int value) async {
    await _box.put('balance', value);
  }

  Future<DateTime> fetchPayoutDate() async {
    return await _box.get('payout_date') ?? DateTime.now();
  }

  Future<void> saveNextPayoutDate(DateTime value) async {
    await _box.put('payout_date', value);
  }
}