import 'package:currency_exchange/services/exchange_model.dart';
import 'package:currency_exchange/services/get_conversion_rate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetRateCubit extends Cubit<double> {
  GetRateCubit()
      : super(
          0.0,
        );
  void getRate({required String from, required String to}) async {
    ExchangeModel exchangeModel =
        await GetConversionRate().getConversionRate(from, to);

    emit(
      exchangeModel.conversionRate,
    );
  }
}
