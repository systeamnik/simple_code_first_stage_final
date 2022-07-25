import 'package:first_stage_final/bloc/product/events_bloc.dart';
import 'package:first_stage_final/bloc/product/states_bloc.dart';
import 'package:first_stage_final/model/data_products.dart';
import 'package:first_stage_final/repo/repo_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProducts extends Bloc<EventBlocProducts, StateBlocProducts> {
  final RepoProducts repo;
  final List<DataProducts> full = [];
  final List<DataProducts> filtered = [];
  String? categories;
  double? ratings;

  BlocProducts({
    required this.repo,
  }) : super(StateProductsInitial()) {
    on<EventReadAll>((event, emit) async {
      emit(StateProductsLoading());

      final result = await repo.getAllProducts(event.sort);
      if (result.errorMessage != null) {
        emit(
          StateProductsError(result.errorMessage!),
        );
        return;
      }
      full.addAll(result.productsList!);
      filtered.clear();
      filtered.addAll(result.productsList!);
      emit(
        StateProductsData(data: filtered),
      );
    });

    List<DataProducts> globalSort(String categort, int rating) {
      List<DataProducts> myList = full.toList();
      if (categort != 'All category') {
        myList = myList
            .where((thing) => thing.category!.contains(categort))
            .toList();
      }
      if (rating != 0) {
        myList = myList
            .where((thing) => thing.rating!.rate!.toInt() == rating)
            .toList();
      }
      return myList;
    }

    on<EventFilterCategory>((event, emit) {
      emit(StateProductsLoading());
      String selectedCategory = event.categoty;
      int selectedRate = event.rating.toInt();
      categories = selectedCategory;

      List<DataProducts> myList = globalSort(selectedCategory, selectedRate);

      myList.sort((DataProducts a, DataProducts b) {
        int indexOfCarInA = a.category!.indexOf(selectedCategory);
        int indexOfCarInB = b.category!.indexOf(selectedCategory);
        if (indexOfCarInA < indexOfCarInB) {
          return -1;
        } else if (indexOfCarInA == indexOfCarInB) {}
        if (a.id! <= b.id!) {
          return -1;
        }
        return 1;
      });

      filtered.clear();
      filtered.addAll(myList);

      if (selectedCategory == "All category") {
        filtered.clear();
        filtered.addAll(full);
        emit(
          StateProductsData(data: filtered),
        );
        return;
      }
      if (filtered.isEmpty) {
        emit(
          StateProductsError("Нет товаров"),
        );
        return;
      }
      emit(
        StateProductsData(data: filtered),
      );
    });

    // !TODO EventFilterRating
    on<EventFilterRating>((event, emit) {
      emit(StateProductsLoading());
      int selectedRate = event.rating.toInt();
      String selectedCategory = event.categoty;

      List<DataProducts> myList = globalSort(selectedCategory, selectedRate);

      myList.sort((DataProducts a, DataProducts b) {
        int indexOfCarInA = a.category!.indexOf(selectedCategory);
        int indexOfCarInB = b.category!.indexOf(selectedCategory);
        if (indexOfCarInA < indexOfCarInB) {
          return -1;
        } else if (indexOfCarInA == indexOfCarInB) {}
        if (a.id! <= b.id!) {
          return -1;
        }
        return 1;
      });
      filtered.clear();
      filtered.addAll(myList);

      if (selectedRate == 0) {
        filtered.clear();
        filtered.addAll(full);
        emit(
          StateProductsData(data: filtered),
        );
        return;
      }
      if (filtered.isEmpty) {
        emit(
          StateProductsError("Нет товаров"),
        );
        return;
      }
      emit(
        StateProductsData(data: filtered),
      );
    });
  }
}
