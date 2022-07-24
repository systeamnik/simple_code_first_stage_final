import 'package:first_stage_final/model/data_products.dart';

abstract class StateBlocProducts {}

class StateProductsInitial extends StateBlocProducts {}

class StateProductsLoading extends StateBlocProducts {}

class StateProductsData extends StateBlocProducts {
  StateProductsData({
    required this.data,
  });
  final List<DataProducts> data;
}

class StateProductsError extends StateBlocProducts {
  StateProductsError(this.error);
  final String error;
}
