import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String toIDRCurrencyFormat() => NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(this);
}