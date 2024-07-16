import 'dart:convert';

import '../coupon.dart';

class GetCouponDetailsResponse {
    Coupon? coupon;
    String? description;
    int? totalCopies;
    dynamic lastCopiedAt;
    int? likeCount;
    int? dislikeCount;

    GetCouponDetailsResponse({
        this.coupon,
        this.description,
        this.totalCopies,
        this.lastCopiedAt,
        this.likeCount,
        this.dislikeCount,
    });

    factory GetCouponDetailsResponse.fromRawJson(String str) => GetCouponDetailsResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetCouponDetailsResponse.fromJson(Map<String, dynamic> json) => GetCouponDetailsResponse(
        coupon: json["data"] == null ? null : Coupon.fromJson(json["data"]),
        description: json["description"],
        totalCopies: json["total_copies"],
        lastCopiedAt: json["last_copied_at"],
        likeCount: json["like_count"],
        dislikeCount: json["dislike_count"],
    );

    Map<String, dynamic> toJson() => {
        "data": coupon?.toJson(),
        "description": description,
        "total_copies": totalCopies,
        "last_copied_at": lastCopiedAt,
        "like_count": likeCount,
        "dislike_count": dislikeCount,
    };
}

