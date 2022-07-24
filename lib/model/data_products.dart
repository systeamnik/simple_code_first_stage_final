import 'package:json_annotation/json_annotation.dart';
part 'data_products.g.dart';

@JsonSerializable()
class DataProducts {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  DataProducts(
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  );

  factory DataProducts.fromJson(Map<String, dynamic> json) =>
      _$DataProductsFromJson(json);

  Map<String, dynamic> toJson() => _$DataProductsToJson(this);
}

@JsonSerializable()
class Rating {
  final double? rate;
  final int? count;

  Rating(
    this.rate,
    this.count,
  );

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
