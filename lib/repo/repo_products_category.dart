import 'dart:developer';
import 'package:first_stage_final/generated/l10n.dart';
import 'package:first_stage_final/repo/api.dart';

class RepoCategory {
  final Api api;

  RepoCategory({required this.api});
  Future<ResultRepoCategory> getAllCatetory() async {
    try {
      final resultJson = await api.dio.get(
        '/products/categories',
      );

      final List<dynamic> productsListJson = resultJson.data ?? [];
      final result = productsListJson.map((e) {
        return e.toString();
      }).toList();

      return ResultRepoCategory(productsList: result);
    } catch (error) {
      log('error: $error');
      return ResultRepoCategory(
        errorMessage: S.current.somethingWentWrong,
      );
    }
  }
}

class ResultRepoCategory {
  final String? errorMessage;
  final List<String>? productsList;

  ResultRepoCategory({
    this.errorMessage,
    this.productsList,
  });
}
