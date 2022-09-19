import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movies/core/shared_widgets/cover_image.dart';

import '../../../core/utils/enums.dart';
import '../../../core/utils/values_manger.dart';
import '../controller/bloc_movies/tv_bloc.dart';
import '../controller/bloc_movies/tv_state.dart';
import '../screens/tv_detail_screen.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
        buildWhen: (previous, current) =>
            previous.popularState != current.popularState,
        builder: (context, state) {
          switch (state.popularState) {
            case RequestState.loading:
              return const SizedBox(
                height: SizeManger.s400,
                child: Center(child: CircularProgressIndicator()),
              );
            case RequestState.loaded:
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: SizeManger.s170,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: state.popularTv.length,
                    itemBuilder: (context, index) {
                      final tv = state.popularTv[index];
                      return Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                            key: key,
                            onTap: () {
                              Get.to(TvDetailScreen(id: tv.id));
                            },
                            child: CoverImage(image: tv.posterPath!)),
                      );
                    },
                  ),
                ),
              );
            case RequestState.error:
              return SizedBox(
                height: 400.0,
                child: Center(
                    child: Text(
                  state.popularMessage,
                  style: Theme.of(context).textTheme.bodySmall,
                )),
              );
          }
        });
  }
}
