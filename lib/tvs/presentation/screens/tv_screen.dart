import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movies/core/utils/colors_manger.dart';
import 'package:movies/core/utils/string_manger.dart';
import 'package:movies/tvs/presentation/components/popular_component.dart';
import 'package:movies/tvs/presentation/components/see_more_popular.dart';
import 'package:movies/tvs/presentation/components/top_rated_component.dart';

import '../../../core/services/services_locator.dart';
import '../components/on_the_air_component.dart';
import '../components/see_more_top_rated.dart';
import '../controller/bloc_movies/tv_bloc.dart';
import '../controller/bloc_movies/tv_event.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<TvBloc>()
        ..add(OnTheAirTvEvent())
        ..add(GetPopularTvEvent())
        ..add(GetTopRatedTvEvent()),
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SingleChildScrollView(
          key: const Key('tvScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OnTheAirComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(StringManger.popular.tr,
                        style: Theme.of(context).textTheme.bodyLarge),
                    InkWell(
                      onTap: () {
                        Get.to(const SeeMorePopularComponent());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(StringManger.seeMore.tr,
                                style: Theme.of(context).textTheme.titleMedium),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularComponent(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(StringManger.airingToday.tr,
                        style: Theme.of(context).textTheme.bodyLarge),
                    InkWell(
                      onTap: () {
                        Get.to(const SeeMoreTopRatedComponent());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(StringManger.seeMore.tr,
                                style: Theme.of(context).textTheme.titleMedium),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedComponent(),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
