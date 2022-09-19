import 'package:dio/dio.dart';
import 'package:movies/core/error/exception.dart';
import 'package:movies/core/network/api_constance.dart';
import 'package:movies/core/network/error_message_model.dart';

import '../../domain/usecase/get_movies_details_usecase.dart';
import '../../domain/usecase/get_recommendation_usecase.dart';
import '../models/tv_details_model.dart';
import '../models/tv_model.dart';
import '../models/recommendation_model.dart';
import '../models/see_more_model.dart';

abstract class BaseTvRemoteDataSource {
  Future<List<TvModel>> onTheAirTv();
  Future<List<TvModel>> getPopularTv();
  Future<List<TvModel>> getTopRatedTv();
  Future<List<SeeMoreTvModel>> getSeeMorePopularTv();
  Future<List<SeeMoreTvModel>> getSeeMoreTopRatedTv();
  Future<TvDetailsModel> getTvDetails(TvDetailsParameter parameter);
  Future<List<RecommendationTvModel>> getRecommendationTv(
      RecommendationTvParameter parameter);
}

class TvRemoteDataSource extends BaseTvRemoteDataSource {
  @override
  Future<List<TvModel>> onTheAirTv() async {
    final response = await Dio().get(ApiConstance.onTheAirTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getPopularTv() async {
    final response = await Dio().get(ApiConstance.popularTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getTopRatedTv() async {
    final response = await Dio().get(ApiConstance.topRatedTvPath);
    if (response.statusCode == 200) {
      return List<TvModel>.from(
          (response.data['results'] as List).map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<TvDetailsModel> getTvDetails(TvDetailsParameter parameter) async {
    final response =
        await Dio().get(ApiConstance.tvDetailsPath(parameter.tvId));
    if (response.statusCode == 200) {
      return TvDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationTvModel>> getRecommendationTv(
      RecommendationTvParameter parameter) async {
    final response =
        await Dio().get(ApiConstance.tvRecommendationPath(parameter.tvId));
    if (response.statusCode == 200) {
      return List<RecommendationTvModel>.from((response.data['results'] as List)
          .map((e) => RecommendationTvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<SeeMoreTvModel>> getSeeMorePopularTv() async {
    final response = await Dio().get(ApiConstance.popularTvPath);
    if (response.statusCode == 200) {
      return List<SeeMoreTvModel>.from((response.data['results'] as List)
          .map((e) => SeeMoreTvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<SeeMoreTvModel>> getSeeMoreTopRatedTv() async {
    final response = await Dio().get(ApiConstance.topRatedTvPath);
    if (response.statusCode == 200) {
      return List<SeeMoreTvModel>.from((response.data['results'] as List)
          .map((e) => SeeMoreTvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
