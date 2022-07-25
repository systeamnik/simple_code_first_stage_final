import 'package:first_stage_final/constants/app_colors.dart';
import 'package:first_stage_final/generated/l10n.dart';
import 'package:first_stage_final/model/data_products.dart';
import 'package:first_stage_final/ui/app_widgets/product_image_widget.dart';
import 'package:first_stage_final/ui/screens/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';

import 'package:first_stage_final/constants/app_styles.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key, required this.productList}) : super(key: key);

  final List<DataProducts> productList;

  String _categoryLabel(String category) {
    if (category == 'All catefory') return S.current.allCategory;
    if (category == 'electronics') return S.current.electronics;
    if (category == 'jewelery') return S.current.jewelery;
    if (category == "men's clothing") return S.current.mens;
    if (category == "women's clothing") return S.current.women;
    return S.current.allCategory;
  }

  @override
  Widget build(BuildContext context) {
    final delegate = S.of(context);
    return GridView.count(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      crossAxisCount: 2,
      mainAxisSpacing: 5.0,
      crossAxisSpacing: 0.0,
      childAspectRatio: (240 / MediaQuery.of(context).size.height) + 0.3,
      addAutomaticKeepAlives: false,
      children: productList.map((product) {
        return InkWell(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.32,
                    height: MediaQuery.of(context).size.width * 0.32,
                    child: ProductImageWidget(
                      width: MediaQuery.of(context).size.width * 0.12,
                      url: product.image,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    // product.category!,
                    _categoryLabel(product.category!),
                    style: AppStyles.s12w500
                        .copyWith(color: AppColors.primaryText),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    product.title!,
                    textAlign: TextAlign.center,
                    style: AppStyles.s14w500,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        delegate.codeProduct,
                        style: AppStyles.s12w400,
                      ),
                      Text(
                        product.id.toString(),
                        style: AppStyles.s12w500,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        delegate.productRating,
                        style: AppStyles.s12w400,
                      ),
                      Text(
                        product.rating!.rate.toString(),
                        style: AppStyles.s12w500,
                      ),
                    ],
                  ),
                  const SizedBox(height: 7),
                  Text(
                    S.of(context).productPrice + product.price!.toString(),
                    style: AppStyles.s16w500,
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            final index = productList.indexOf(product);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  id: index,
                  productList: productList,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
