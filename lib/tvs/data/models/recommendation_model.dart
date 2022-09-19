import '../../domain/entities/recommendation.dart';

class RecommendationTvModel extends TvRecommendation {
  const RecommendationTvModel({
    super.backdropPath,
    required super.id,
  });
  factory RecommendationTvModel.fromJson(Map<String, dynamic> json) =>
      RecommendationTvModel(
        id: json['id'],
        backdropPath:
            json['backdrop_path'] ?? '/5hNcsnMkwU2LknLoru73c76el3z.jpg',
      );
}
