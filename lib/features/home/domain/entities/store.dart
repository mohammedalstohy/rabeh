class Store {
  final int id;
  String? nameAr;
  String? nameEn;
  String? linkAr;
  String? linkEn;
  int? categoryId;
  String? token;
  String? descriptionAr;
  String? descriptionEn;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? name;
  String? description;
  String? images;
  List<StoreCoupon>? coupons;
    StoreCategory? category;

  Store({
    required this.id,
    this.nameAr,
    this.nameEn,
    this.linkAr,
    this.linkEn,
    this.categoryId,
    this.token,
    this.descriptionAr,
    this.descriptionEn,
    this.createdAt,
    this.updatedAt,
    this.name,
    this.description,
    this.images,
        this.coupons,
        this.category,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        linkAr: json["link_ar"],
        linkEn: json["link_en"],
        categoryId: json["category_id"],
        token: json["token"],
        descriptionAr: json["description_ar"],
        descriptionEn: json["description_en"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        name: json["name"],
        description: json["description"],
        images: json["images"],        coupons: json["coupons"] == null ? [] : List<StoreCoupon>.from(json["coupons"]!.map((x) => StoreCoupon.fromJson(x))),
        category: json["category"] == null ? null : StoreCategory.fromJson(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "link_ar": linkAr,
        "link_en": linkEn,
        "category_id": categoryId,
        "token": token,
        "description_ar": descriptionAr,
        "description_en": descriptionEn,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "name": name,
        "description": description,
        "images": images,
        "coupons": coupons == null ? [] : List<dynamic>.from(coupons!.map((x) => x.toJson())),
        "category": category?.toJson(),
      };
}


class StoreCategory {
    int? id;
    String? nameAr;
    String? nameEn;
    String? name;

    StoreCategory({
        this.id,
        this.nameAr,
        this.nameEn,
        this.name,
    });


    factory StoreCategory.fromJson(Map<String, dynamic> json) => StoreCategory(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "name": name,
    };
}

class StoreCoupon {
    int? id;
    String? code;
    int? discountPercentage;
    String? descriptionAr;
    String? descriptionEn;
    int? storeId;
    int? countryId;
    int? displayOrder;
    String? isFeatured;
    DateTime? createdAt;
    DateTime? updatedAt;

    StoreCoupon({
        this.id,
        this.code,
        this.discountPercentage,
        this.descriptionAr,
        this.descriptionEn,
        this.storeId,
        this.countryId,
        this.displayOrder,
        this.isFeatured,
        this.createdAt,
        this.updatedAt,
    });


    factory StoreCoupon.fromJson(Map<String, dynamic> json) => StoreCoupon(
        id: json["id"],
        code: json["code"],
        discountPercentage: json["discount_percentage"],
        descriptionAr: json["description_ar"],
        descriptionEn: json["description_en"],
        storeId: json["store_id"],
        countryId: json["country_id"],
        displayOrder: json["display_order"],
        isFeatured: json["is_featured"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "discount_percentage": discountPercentage,
        "description_ar": descriptionAr,
        "description_en": descriptionEn,
        "store_id": storeId,
        "country_id": countryId,
        "display_order": displayOrder,
        "is_featured": isFeatured,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
