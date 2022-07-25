import 'package:first_stage_final/generated/l10n.dart';
import 'package:first_stage_final/model/data_products.dart';
import 'package:first_stage_final/ui/app_widgets/product_image_widget.dart';
import 'package:first_stage_final/ui/app_widgets/subtitle_widget.dart';
import 'package:first_stage_final/ui/app_widgets/title_widget.dart';
import 'package:first_stage_final/ui/screens/detail_screen/detail_screen.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
    required this.productList,
  }) : super(key: key);

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
    return ListView.separated(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: productList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 5);
      },
      itemBuilder: (BuildContext context, int index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ListTile(
            leading: ProductImageWidget(
              width: MediaQuery.of(context).size.width * 0.10,
              url: productList[index].image,
            ),
            title: titleWidget(
              // productList[index].category!,
              _categoryLabel(productList[index].category.toString()),
              productList[index].title!,
            ),
            subtitle: subTitleWidget(
              delegate,
              productList[index].id.toString(),
              productList[index].rating!.rate!.toString(),
              productList[index].price!.toString(),
            ),
            onTap: () {
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
          ),
        );
      },
    );
  }
}
