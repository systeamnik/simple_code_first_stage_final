import 'package:first_stage_final/bloc/category/events_bloc.dart';
import 'package:first_stage_final/bloc/category/states_bloc.dart';
import 'package:first_stage_final/repo/repo_products_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCatrgory extends Bloc<EventBlocCaregory, StateBlocCategory> {
  final RepoCategory repo;

  BlocCatrgory({
    required this.repo,
  }) : super(StateCategoryInitial()) {
    on<EventAllCategory>((event, emit) async {
      emit(StateCategoryLoading());

      final result = await repo.getAllCatetory();
      if (result.errorMessage != null) {
        emit(
          StateCategoryError(result.errorMessage!),
        );
        return;
      }
      result.productsList!.insert(0, 'All category');
      emit(
        StateCategoryData(data: result.productsList!),
      );
    });
  }
}
