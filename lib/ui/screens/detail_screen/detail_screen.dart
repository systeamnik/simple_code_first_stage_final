import 'package:first_stage_final/constants/app_assets.dart';
import 'package:first_stage_final/constants/app_colors.dart';
import 'package:first_stage_final/constants/app_styles.dart';
import 'package:first_stage_final/generated/l10n.dart';
import 'package:first_stage_final/model/data_products.dart';
import 'package:first_stage_final/ui/app_widgets/navbar_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.id,
    required this.productList,
  }) : super(key: key);

  final List<DataProducts> productList;
  final int id;

  @override
  Widget build(BuildContext context) {
    print("object : $id");
    final url = productList[id].image;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        color: AppColors.primary,
        child: SafeArea(
          bottom: false,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primary,
              elevation: 0,
              title: AppTitleWidget(
                titleText: S.of(context).detail,
                isShowLogo: false,
              ),
            ),
            body: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 32),
                      Text(
                        productList[id].category.toString(),
                        style: AppStyles.s16w400.copyWith(
                          color: AppColors.primaryText,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        productList[id].title.toString(),
                        style: AppStyles.s16w500,
                      ),
                      const SizedBox(height: 16),
                      Image(
                        width: MediaQuery.of(context).size.width * 0.60,
                        image: url == null
                            ? AssetImage(AppAssets.images.noImage)
                                as ImageProvider
                            : NetworkImage(url),
                      ),
                      const SizedBox(height: 16),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 0,
                        color: AppColors.formBackground,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                S.of(context).productRating +
                                    ': ' +
                                    productList[id].rating!.rate!.toString(),
                                style: AppStyles.s16w500,
                              ),
                              Text(
                                S.of(context).productPrice +
                                    ' ' +
                                    productList[id].price.toString(),
                                style: AppStyles.s16w500,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          elevation: 0,
                          color: AppColors.formBackground,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Text(
                              productList[id].description.toString(),
                              style: AppStyles.s16w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
