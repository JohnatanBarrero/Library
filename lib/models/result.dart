import 'dart:convert';

import 'doc.dart';

Result resultFromJson(String str) => Result.fromJson(json.decode(str));

String resultToJson(Result data) => json.encode(data.toJson());

class Result {
    Result({
        this.numFound,
        this.start,
        this.numFoundExact,
        this.docs,
        this.resultNumFound,
        this.q,
        this.offset,
    });

    final int? numFound;
    final int? start;
    final bool? numFoundExact;
    final List<Doc>? docs;
    final int? resultNumFound;
    final String? q;
    final dynamic offset;

    Result copyWith({
        int? numFound,
        int? start,
        bool? numFoundExact,
        List<Doc>? docs,
        int? resultNumFound,
        String? q,
        dynamic offset,
    }) => 
        Result(
            numFound: numFound ?? this.numFound,
            start: start ?? this.start,
            numFoundExact: numFoundExact ?? this.numFoundExact,
            docs: docs ?? this.docs,
            resultNumFound: resultNumFound ?? this.resultNumFound,
            q: q ?? this.q,
            offset: offset ?? this.offset,
        );

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        numFound: json["numFound"],
        start: json["start"],
        numFoundExact: json["numFoundExact"],
        docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
        resultNumFound: json["num_found"],
        q: json["q"],
        offset: json["offset"],
    );

    Map<String, dynamic> toJson() => {
        "numFound": numFound,
        "start": start,
        "numFoundExact": numFoundExact,
        "docs": List<dynamic>.from(docs!.map((x) => x.toJson())),
        "num_found": resultNumFound,
        "q": q,
        "offset": offset,
    };
}