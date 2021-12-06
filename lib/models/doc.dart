class Doc {
  Doc({
    this.title,
    this.coverEditionKey,
    this.authorName,
    this.yearPublication,
  });

  final String? title;

  final String? coverEditionKey;

  final List<String>? authorName;
  final String? yearPublication;

  Doc copyWith({
    String? title,
    String? coverEditionKey,
    List<String>? authorName,
    String? yearPublication,
  }) =>
      Doc(
          title: title ?? this.title,
          coverEditionKey: coverEditionKey ?? this.coverEditionKey,
          authorName: authorName ?? this.authorName,
          yearPublication: yearPublication ?? this.yearPublication);

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        title: json['title'],
        coverEditionKey: json['cover_edition_key'],
        authorName: json['author_name'] == null
            ? null
            : List<String>.from(json['author_name']!.map((x) => x)),
        yearPublication: json['first_publish_year'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'cover_edition_key': coverEditionKey,
        'author_name': authorName == null
            ? null
            : List<dynamic>.from(authorName!.map((x) => x)),
        'first_publish_year': yearPublication
      };
}
