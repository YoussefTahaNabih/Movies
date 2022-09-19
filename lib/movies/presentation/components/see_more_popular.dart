import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/shared_widgets/card_see_more.dart';
import 'package:movies/core/utils/colors_manger.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/presentation/controller/bloc_movies/movies_state.dart';
import '../../../core/services/services_locator.dart';
import '../controller/bloc_movies/movies_bloc.dart';
import '../controller/bloc_movies/movies_event.dart';

class SeeMorePopularComponent extends StatelessWidget {
  const SeeMorePopularComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MoviesBloc>()..add(GetSeeMorePopularEvent()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
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
                    itemCount: state.seeMorePopularMovies.length,
                    itemBuilder: (context, index) {
                      final movie = state.seeMorePopularMovies[index];
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
