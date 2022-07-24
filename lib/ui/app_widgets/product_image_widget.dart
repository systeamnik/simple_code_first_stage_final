import 'package:first_stage_final/constants/app_assets.dart';
import 'package:flutter/material.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({
    Key? key,
    required this.url,
    required this.width,
  }) : super(key: key);

  final String? url;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image(
      width: width,
      image: url == null
          ? AssetImage(AppAssets.images.noImage) as ImageProvider
          : NetworkImage(url!),
    );
  }
}
