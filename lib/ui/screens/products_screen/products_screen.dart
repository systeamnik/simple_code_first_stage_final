import 'package:first_stage_final/bloc/category/bloc_caregory.dart';
import 'package:first_stage_final/bloc/category/states_bloc.dart';
import 'package:first_stage_final/bloc/product/bloc_products.dart';
import 'package:first_stage_final/bloc/product/events_bloc.dart';
import 'package:first_stage_final/bloc/product/states_bloc.dart';
import 'package:first_stage_final/constants/app_assets.dart';
import 'package:first_stage_final/constants/app_colors.dart';
import 'package:first_stage_final/constants/app_styles.dart';
import 'package:first_stage_final/generated/l10n.dart';
import 'package:first_stage_final/ui/app_widgets/bottom_navbar_widget.dart';
import 'package:first_stage_final/ui/app_widgets/navbar_title_widget.dart';
import 'package:first_stage_final/ui/app_widgets/show_sheet_widget.dart';
import 'package:first_stage_final/ui/screens/products_screen/widgets/gridview_widget.dart';
import 'package:first_stage_final/ui/screens/products_screen/widgets/listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  static final isListView = ValueNotifier(true);
  static final isSortDesc = ValueNotifier(false);
  static final selectedCategory = ValueNotifier("All category");
  static final selectedRating = ValueNotifier(0.0);

  // String dropdownValue = "one";
  // bool isSortDesc = false;

  @override
  Widget build(BuildContext context) {
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
                titleText: S.of(context).products,
                isShowLogo: true,
              ),
            ),
            bottomNavigationBar: const BottomNavbarWidget(currentPage: 0),
            body: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColors.primary,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10, bottom: 16),
                      child: Column(
                        children: [
                          BlocBuilder<BlocProducts, StateBlocProducts>(
                            builder: (context, state) {
                              var productsTotal = 0;
                              final sizeWidth =
                                  MediaQuery.of(context).size.width;
                              final sizeHeight =
                                  MediaQuery.of(context).size.height;
                              if (state is StateProductsData) {
                                productsTotal = state.data.length;
                              }
                              return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                elevation: 0,
                                color: AppColors.formBackground,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          S.of(context).productCount +
                                              ": " +
                                              productsTotal.toString(),
                                          style: AppStyles.s16w500.copyWith(),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          isSortDesc.value = !isSortDesc.value;
                                          String sort =
                                              isSortDesc.value ? 'desc' : 'asc';
                                          BlocProvider.of<BlocProducts>(context)
                                              .add(EventReadAll(sort));
                                        },
                                        icon: ValueListenableBuilder<bool>(
                                          valueListenable: isSortDesc,
                                          builder:
                                              (context, isSortViewMode, _) {
                                            return isSortViewMode
                                                ? SvgPicture.asset(
                                                    AppAssets.svg.iconSortDesc,
                                                    width: 20,
                                                    height: 20,
                                                  )
                                                : SvgPicture.asset(
                                                    AppAssets.svg.iconSortAsc,
                                                    width: 20,
                                                    height: 20,
                                                  );
                                          },
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          isListView.value = !isListView.value;
                                        },
                                        icon: ValueListenableBuilder<bool>(
                                          valueListenable: isListView,
                                          builder:
                                              (context, isListViewMode, _) {
                                            return isListViewMode
                                                ? SvgPicture.asset(
                                                    AppAssets.svg.iconList,
                                                    width:
                                                        (80 / sizeWidth) * 100,
                                                    height: (170 / sizeHeight) *
                                                        100,
                                                  )
                                                : SvgPicture.asset(
                                                    AppAssets.svg.iconGrid,
                                                    width:
                                                        (80 / sizeWidth) * 100,
                                                    height: (170 / sizeHeight) *
                                                        100,
                                                  );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          BlocBuilder<BlocCatrgory, StateBlocCategory>(
                            builder: ((context, state) {
                              if (state is StateCategoryLoading) {
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  elevation: 0,
                                  color: AppColors.formBackground,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: 32,
                                          height: 32,
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                              if (state is StateCategoryError) {
                                return Text(state.error);
                              }
                              if (state is StateCategoryData) {
                                state.data;
                                return Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  elevation: 0,
                                  color: AppColors.formBackground,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ValueListenableBuilder(
                                          valueListenable: selectedCategory,
                                          builder:
                                              (context, selectedValueMode, _) {
                                            return TextButton(
                                              child: Text(
                                                selectedValueMode as String,
                                                // S.of(context).allCategory,
                                                // state.data[0],
                                              ),
                                              onPressed: () {
                                                showSheetWidget(
                                                  context: context,
                                                  // ['first', 'secound'],
                                                  categoriesList: state.data,
                                                  callBack: (e) {
                                                    Navigator.pop(context);
                                                    selectedCategory.value = e;
                                                    BlocProvider.of<
                                                                BlocProducts>(
                                                            context)
                                                        .add(
                                                            EventFilterCategory(
                                                                e,
                                                                selectedRating
                                                                    .value));
                                                  },
                                                );
                                              },
                                            );
                                          },
                                        ),
                                        Row(
                                          children: [
                                            ValueListenableBuilder(
                                              valueListenable: selectedRating,
                                              builder: (context,
                                                  selectedRatingMode, _) {
                                                return DropdownButton<double>(
                                                  hint: Text(
                                                    S.of(context).productRating,
                                                  ),
                                                  value: selectedRatingMode
                                                      as double,
                                                  items: const [
                                                    DropdownMenuItem(
                                                      child:
                                                          Text("Rating: All"),
                                                      value: 0.0,
                                                      alignment:
                                                          AlignmentDirectional
                                                              .centerStart,
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text("Rating: 2"),
                                                      value: 2.0,
                                                      alignment:
                                                          AlignmentDirectional
                                                              .centerStart,
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text("Rating: 3"),
                                                      value: 3.0,
                                                      alignment:
                                                          AlignmentDirectional
                                                              .centerStart,
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text("Rating: 4"),
                                                      value: 4.0,
                                                      alignment:
                                                          AlignmentDirectional
                                                              .centerStart,
                                                    ),
                                                    DropdownMenuItem(
                                                      child: Text("Rating: 5"),
                                                      alignment:
                                                          AlignmentDirectional
                                                              .centerStart,
                                                      value: 5.0,
                                                    ),
                                                  ],
                                                  onChanged: (value) {
                                                    if (value == null) return;
                                                    selectedRating.value =
                                                        value;
                                                    BlocProvider.of<
                                                                BlocProducts>(
                                                            context)
                                                        .add(EventFilterRating(
                                                            value,
                                                            selectedCategory
                                                                .value));
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: BlocBuilder<BlocProducts, StateBlocProducts>(
                        builder: ((context, state) {
                          if (state is StateProductsLoading) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(),
                              ],
                            );
                          }
                          if (state is StateProductsError) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(state.error),
                                ),
                              ],
                            );
                          }
                          if (state is StateProductsData) {
                            if (state.data.isEmpty) {
                              return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.60,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        color: Colors.blue,
                                      ),
                                      Image.asset(
                                        AppAssets.images.noImage,
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        S.of(context).productsListIsEmpty,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return ValueListenableBuilder<bool>(
                                valueListenable: isListView,
                                builder: (context, isListViewMode, _) {
                                  return isListViewMode
                                      ? ListViewWidget(productList: state.data)
                                      : GridViewWidget(productList: state.data);
                                },
                              );
                            }
                          }
                          return const SizedBox.shrink();
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
