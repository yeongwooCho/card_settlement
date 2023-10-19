import 'package:intl/intl.dart';

extension MoneyString on String {
  // 이메일 포맷 검증
  String convertIntToMoneyString({
    required int number,
  }) {
    final NumberFormat numberFormat = NumberFormat('###,###,###,###');
    // print(numberFormat.format(1000000);
    // # ==> 1,000,000
    return numberFormat.format(number);
  }
}
