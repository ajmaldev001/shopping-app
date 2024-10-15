class ProductsCategoryModel {
  final List<ProductsCategory?> productsList;

  ProductsCategoryModel({required this.productsList});

  factory ProductsCategoryModel.fromJson(List<dynamic> json) {
    return ProductsCategoryModel(
      productsList: json.map((item) => ProductsCategory.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productsList': productsList.map((product) => product?.toJson()).toList(),
    };
  }
}

class ProductsCategory {
  final String? slug;
  final String? name;
  final String? url;

  ProductsCategory({
    this.slug,
    this.name,
    this.url,
  });

  factory ProductsCategory.fromJson(Map<String, dynamic> json) {
    return ProductsCategory(
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'name': name,
      'url': url,
    };
  }
}