// To parse this JSON data, do
//
//     final booked = bookedFromJson(jsonString);

import 'dart:convert';

Booked bookedFromJson(String str) => Booked.fromJson(json.decode(str));

String bookedToJson(Booked data) => json.encode(data.toJson());

class Booked {
    bool? success;
    List<BookedData>? data;

    Booked({
        this.success,
        this.data,
    });

    factory Booked.fromJson(Map<String, dynamic> json) => Booked(
        success: json["success"],
        data: json["data"] == null ? [] : List<BookedData>.from(json["data"]!.map((x) => BookedData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class BookedData {
    int? table;
    String? booker;
    String? slip;

    BookedData({
        this.table,
        this.booker,
        this.slip,
    });

    factory BookedData.fromJson(Map<String, dynamic> json) => BookedData(
        table: json["table"],
        booker: json["booker"],
        slip: json["slip"],
    );

    Map<String, dynamic> toJson() => {
        "table": table,
        "booker": booker,
        "slip": slip,
    };
}
