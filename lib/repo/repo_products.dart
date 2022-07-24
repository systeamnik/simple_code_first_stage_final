import 'dart:developer';

import 'package:first_stage_final/generated/l10n.dart';
import 'package:first_stage_final/model/data_products.dart';
import 'package:first_stage_final/repo/api.dart';

class RepoProducts {
  final Api api;

  RepoProducts({required this.api});
  Future<ResultRepoProducts> getAllProducts(String sort) async {
    try {
      final resultJson = await api.dio.get(
        '/products?sort=$sort',
        // queryParameters: {
        //   'name': name,
        // },
      );

      final List productsListJson = resultJson.data ?? [];
      final result = productsListJson
          .map(
            (e) => DataProducts.fromJson(e),
          )
          .toList();
      return ResultRepoProducts(productsList: result);
    } catch (error) {
      log('error: $error');
      return ResultRepoProducts(
        errorMessage: S.current.somethingWentWrong,
      );
    }
  }
}

class ResultRepoProducts {
  final String? errorMessage;
  final List<DataProducts>? productsList;

  ResultRepoProducts({
    this.errorMessage,
    this.productsList,
  });
}
