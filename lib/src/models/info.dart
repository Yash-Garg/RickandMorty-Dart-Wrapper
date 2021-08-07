class Info {
  Info({
    required this.count,
    required this.pages,
    this.next = '',
    this.prev = '',
  });

  final int count;
  final int pages;
  final String? next;
  final String? prev;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}
