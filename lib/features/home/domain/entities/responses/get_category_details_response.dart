import '../category.dart';

class GetCategoryDetailsResponse {
  final List<Category> categories;

  GetCategoryDetailsResponse({
    required this.categories,
  });

  factory GetCategoryDetailsResponse.fromJson(Map<String, dynamic> json) =>
      GetCategoryDetailsResponse(
        categories:
            List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(
          categories.map(
            (x) => x.toJson(),
          ),
        ),
      };
}
