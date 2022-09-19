import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movies/core/shared_widgets/cover_image.dart';
import 'package:movies/core/utils/colors_manger.dart';

import '../../../core/utils/enums.dart';
import '../../../core/utils/values_manger.dart';
import '../controller/bloc_movies/tv_bloc.dart';
import '../controller/bloc_movies/tv_state.dart';
import '../screens/tv_detail_screen.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
        buildWhen: (previous, current) =>
            previous.topRatedState != current.topRatedState,
        builder: (context, state) {
          switch (state.topRatedState) {
            case RequestState.loading:
              return SizedBox(
                height: 200.0,
                child: SizedBox(
                  height: SizeManger.s400,
                  child: Center(
                      child: CircularProgressIndicator(
                    color: ColorManager.white,
                  )),
                ),
              );
            case RequestState.loaded:
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: SizedBox(
                  height: 170.0,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: state.topRatedTv.length,
                    itemBuilder: (context, index) {
                      final tv = state.topRatedTv[index];
                      return Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
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
                    child: Text(state.topRatedMessage,
                        style: Theme.of(context).textTheme.bodySmall)),
              );
          }
        });
  }
}
