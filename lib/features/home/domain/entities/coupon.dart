class Coupon {
    final int id;
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
    CouponStore? store;
    Country? country;

    Coupon({
        required this.id,
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
        this.store,
        this.country,
    });

    factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
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
        store: json["store"] == null ? null : CouponStore.fromJson(json["store"]),
        country: json["country"] == null ? null : Country.fromJson(json["country"]),
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
        "store": store?.toJson(),
        "country": country?.toJson(),
    };
}

class Country {
    final int id;
    String? nameAr;
    String? nameEn;
    String? flag;
    String? currency;
    DateTime? createdAt;
    DateTime? updatedAt;

    Country({
        required this.id,
        this.nameAr,
        this.nameEn,
        this.flag,
        this.currency,
        this.createdAt,
        this.updatedAt,
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        flag: json["flag"],
        currency: json["currency"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "flag": flag,
        "currency": currency,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class CouponStore {
    final int id;
    String? nameAr;
    String? nameEn;
    String? linkAr;
    String? linkEn;
    int? categoryId;
    String? token;
    dynamic descriptionAr;
    dynamic descriptionEn;
    DateTime? createdAt;
    DateTime? updatedAt;

    CouponStore({
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
    });

    factory CouponStore.fromJson(Map<String, dynamic> json) => CouponStore(
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
    };
}
