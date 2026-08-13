class SourceNews {
  dynamic id;
  String? name;

  SourceNews({this.id, this.name});

  factory SourceNews.fromJson(Map<String, dynamic> json) =>
      SourceNews(id: json['id'] as dynamic, name: json['name'] as String?);

  Map<String, dynamic> toJson() => {'id': id, 'name': name};
}
