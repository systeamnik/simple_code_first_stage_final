abstract class StateBlocCategory {}

class StateCategoryInitial extends StateBlocCategory {}

class StateCategoryLoading extends StateBlocCategory {}

class StateCategoryData extends StateBlocCategory {
  StateCategoryData({
    required this.data,
  });
  final List<String> data;
}

class StateCategoryError extends StateBlocCategory {
  StateCategoryError(this.error);
  final String error;
}
