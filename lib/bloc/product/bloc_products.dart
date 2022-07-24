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
    List<DataProducts> globalSort(String categort, int rating) {
      List<DataProducts> myList = full.toList();
      if (categort != 'All category') {
        myList.where((thing) => thing.category!.contains(categort)).toList();
      }
      if (rating != 0) {
        myList.where((thing) => thing.rating!.rate!.toInt() == rating).toList();
      }
      return myList;
    }

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

    on<EventFilterCategory>((event, emit) {
      emit(StateProductsLoading());
      String selectedCategory = event.categoty;
      int selectedRate = event.rating.toInt();
      categories = selectedCategory;

      print("bloc categort: $selectedCategory");

      // List<DataProducts> myList = globalSort(selectedCategory, selectedRate);
      List<DataProducts> myList = full.toList();

      if (selectedCategory != 'All category') {
        myList
            .where((thing) => thing.category!.contains(selectedCategory))
            .toList();
      }
      if (selectedRate != 0) {
        myList
            .where((thing) => thing.rating!.rate!.toInt() == selectedRate)
            .toList();
      }

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

      myList.map((e) {
        print(e.category);
      });

      filtered.clear();
      filtered.addAll(myList);

      // if (selectedCategory == "All category") {
      //   filtered.clear();
      //   filtered.addAll(full);
      //   emit(
      //     StatePersonsData(data: filtered),
      //   );
      //   return;
      // }
      if (filtered.isEmpty) {
        emit(
          StateProductsError("Список не готов"),
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
      double rating = event.rating;
      print("rating: $rating");

      if (categories != null && ratings != null) {
        print("categories: $categories + rating: $ratings");
      }

      // full.sort(((a, b) => a.rating!.rate!.compareTo(b.rating!.rate!)));
      // print(full);
      // full.sort((a, b) => a.rating!.rate!.compareTo(b.rating!.rate!));
      // var firstList = [1, 2, 3, 4, 5, 6];
      // full.firstWhere((i) => i.rating!.rate! < rating);
      // print(firstList.firstWhere((i) => i < 6));

      // List<DataProducts> myList =
      //     full.where((thing) => thing.rating!.rate!.compareTo(rating)).toList();

      // myList.sort((DataProducts a, DataProducts b) {
      //   int indexOfCarInA = a.rating!.rate.indexOf(categort);
      //   int indexOfCarInB = b.category!.indexOf(categort);
      //   if (indexOfCarInA < indexOfCarInB) {
      //     return -1;
      //   } else if (indexOfCarInA == indexOfCarInB) {}
      //   if (a.id! <= b.id!) {
      //     return -1;
      //   }
      //   return 1;
      // });
      // filtered.clear();
      // filtered.addAll(full);

      // if (rating == 0.0) {
      //   filtered.clear();
      //   filtered.addAll(full);
      //   emit(
      //     StatePersonsData(data: filtered),
      //   );
      //   return;
      // }
      // if (filtered.isEmpty) {
      //   emit(
      //     StatePersonsError("Список не готов"),
      //   );
      //   return;
      // }
      // emit(
      //   StatePersonsData(data: filtered),
      // );
    });
  }
}
