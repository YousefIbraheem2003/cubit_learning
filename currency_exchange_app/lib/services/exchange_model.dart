class ExchangeModel {
  String baseCode;
  String targetCode;
  double conversionRate;

  ExchangeModel({
    required this.baseCode,
    required this.targetCode,
    required this.conversionRate,
  });

  factory ExchangeModel.fromJson(json) {
    return ExchangeModel(
      conversionRate: json['conversion_rate'],
      baseCode: 'base_code',
      targetCode: 'target_code',
    );
  }
}
