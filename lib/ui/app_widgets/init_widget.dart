import 'package:first_stage_final/bloc/category/bloc_caregory.dart';
import 'package:first_stage_final/bloc/category/events_bloc.dart';
import 'package:first_stage_final/bloc/product/bloc_products.dart';
import 'package:first_stage_final/bloc/product/events_bloc.dart';
import 'package:first_stage_final/repo/api.dart';
import 'package:first_stage_final/repo/repo_products.dart';
import 'package:first_stage_final/repo/repo_products_category.dart';
import 'package:first_stage_final/repo/repo_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Api(),
        ),
        RepositoryProvider(
          create: (context) => RepoSettings(),
        ),
        RepositoryProvider(
          create: (context) => RepoProducts(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
        RepositoryProvider(
          create: (context) => RepoCategory(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BlocProducts>(
            create: (context) => BlocProducts(
              repo: RepositoryProvider.of(context),
            )..add(
                EventReadAll('asc'),
              ),
          ),
          BlocProvider<BlocCatrgory>(
            create: (context) => BlocCatrgory(
              repo: RepositoryProvider.of(context),
            )..add(EventAllCategory()),
          ),
        ],
        child: child,
      ),
    );
  }
}
