abstract class EventBlocProducts {}

class EventReadAll extends EventBlocProducts {
  final String sort;

  EventReadAll(this.sort);
}

class EventFilterCategory extends EventBlocProducts {
  final String categoty;
  final double rating;

  EventFilterCategory(this.categoty, this.rating);
}

class EventFilterRating extends EventBlocProducts {
  final double rating;
  final String categoty;

  EventFilterRating(this.rating, this.categoty);
}
