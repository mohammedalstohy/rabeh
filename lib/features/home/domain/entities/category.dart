import 'store.dart';

class Category {
  final int id;
  final String nameAr;
  final String nameEn;
  final String name;
  final List<Store> stores;

  Category({
    required this.id,
    required this.nameAr,
    required this.nameEn,
    required this.name,
    required this.stores,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        nameAr: json["name_ar"],
        nameEn: json["name_en"],
        name: json["name"],
        stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name_ar": nameAr,
        "name_en": nameEn,
        "name": name,
        "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
      };
}

