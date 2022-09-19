import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movies/core/shared_widgets/cover_image.dart';
import 'package:movies/core/utils/colors_manger.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/values_manger.dart';
import '../controller/bloc_movies/movies_bloc.dart';
import '../controller/bloc_movies/movies_state.dart';
import '../screens/movie_detail_screen.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
        buildWhen: (previous, current) =>
            previous.popularState != current.popularState,
        builder: (context, state) {
          switch (state.popularState) {
            case RequestState.loading:
              return SizedBox(
                height: SizeManger.s400,
                child: Center(
                  child: CircularProgressIndicator(
                    backgroundColor: ColorManager.primary,
                  ),
                ),
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
                    itemCount: state.popularMovies.length,
                    itemBuilder: (context, index) {
                      final movie = state.popularMovies[index];
                      return Container(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: InkWell(
                            key: key,
                            onTap: () {
                              Get.to(MovieDetailScreen(id: movie.id));
                            },
                            child: CoverImage(image: movie.backdropPath)),
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
                  state.nowPlayingMessage,
                  style: Theme.of(context).textTheme.bodySmall,
                )),
              );
          }
        });
  }
}
