import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/shared_widgets/card_see_more.dart';
import 'package:movies/core/utils/colors_manger.dart';
import 'package:movies/core/utils/enums.dart';
import '../../../core/services/services_locator.dart';
import '../controller/bloc_movies/tv_bloc.dart';
import '../controller/bloc_movies/tv_event.dart';
import '../controller/bloc_movies/tv_state.dart';

class SeeMorePopularComponent extends StatelessWidget {
  const SeeMorePopularComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<TvBloc>()..add(GetSeeMorePopularTvEvent()),
      child: BlocBuilder<TvBloc, TvState>(
        builder: (context, state) {
          switch (state.seeMorePularState) {
            case RequestState.loading:
              return const SizedBox(
                height: 400.0,
                child: Center(child: CircularProgressIndicator()),
              );
            case RequestState.loaded:
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: const Text('Popular Movies'),
                ),
                backgroundColor: Colors.white,
                body: Container(
                  color: ColorManager.primary,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    itemCount: state.seeMorePopularTv.length,
                    itemBuilder: (context, index) {
                      final movie = state.seeMorePopularTv[index];
                      return CardSeeMore(
                          title: movie.title,
                          image: movie.backdropPath,
                          releaseDate: movie.releaseDate,
                          voteAverage: movie.voteAverage.toString(),
                          overview: movie.overview);
                    },
                  ),
                ),
              );
            case RequestState.error:
              return SizedBox(
                height: 400.0,
                child: Center(child: Text(state.popularMessage)),
              );
          }
        },
      ),
    );
  }
}
