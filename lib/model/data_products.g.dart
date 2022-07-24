// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataProducts _$DataProductsFromJson(Map<String, dynamic> json) => DataProducts(
      json['id'] as int?,
      json['title'] as String?,
      (json['price'] as num?)?.toDouble(),
      json['description'] as String?,
      json['category'] as String?,
      json['image'] as String?,
      json['rating'] == null
          ? null
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataProductsToJson(DataProducts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      (json['rate'] as num?)?.toDouble(),
      json['count'] as int?,
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
