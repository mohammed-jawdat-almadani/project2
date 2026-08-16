class CategoryModel {
  final int id;
  final String name;
  final String? iconUrl;
  final String? guidePrice;
  final List<CategoryModel> children;

  CategoryModel({
    required this.id,
    required this.name,
    this.iconUrl,
    this.guidePrice,
    this.children = const [],
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      iconUrl: json['icon_url'] as String?,
      guidePrice: json['guide_price'] as String?,
      children: json['children'] != null
          ? (json['children'] as List).map((e) => CategoryModel.fromJson(e)).toList()
          : [],
    );
  }
}
