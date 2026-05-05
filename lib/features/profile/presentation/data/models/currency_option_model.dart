class CurrencyOptionModel {
  final String code;
  final String name;
  final String symbol;

  const CurrencyOptionModel({
    required this.code,
    required this.name,
    required this.symbol,
  });

  String get label {
    return '$code - $name ($symbol)';
  }
}