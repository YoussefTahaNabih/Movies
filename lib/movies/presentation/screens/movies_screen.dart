import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movies/core/utils/colors_manger.dart';
import 'package:movies/core/utils/string_manger.dart';
import 'package:movies/movies/presentation/components/popular_component.dart';
import 'package:movies/movies/presentation/components/see_more_popular.dart';
import 'package:movies/movies/presentation/components/top_rated_component.dart';

import '../../../core/services/services_locator.dart';
import '../components/now_playing_component.dart';
import '../components/see_more_top_rated.dart';
import '../controller/bloc_movies/movies_bloc.dart';
import '../controller/bloc_movies/movies_event.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MoviesBloc>()
        ..add(GetNowPlayingEvent())
        ..add(GetPopularEvent())
        ..add(GetTopRatedEvent()),
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingComponent(),
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
                    Text(StringManger.topRated.tr,
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
