
import '../store.dart';

class GetStoresOrStoreDetailsResponse {
    List<Store>? store;

    GetStoresOrStoreDetailsResponse({
        this.store,
    });

    factory GetStoresOrStoreDetailsResponse.fromJson(Map<String, dynamic> json) => GetStoresOrStoreDetailsResponse(
        store: json["data"] == null ? [] : List<Store>.from(json["data"]!.map((x) => Store.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": store == null ? [] : List<dynamic>.from(store!.map((x) => x.toJson())),
    };
}

