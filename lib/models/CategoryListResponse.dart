class CategoryListResponse {
  CategoryListResponse({
      this.slug, 
      this.name, 
      this.url,});

  CategoryListResponse.fromJson(dynamic json) {
    slug = json['slug'];
    name = json['name'];
    url = json['url'];
  }
  String? slug;
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['slug'] = slug;
    map['name'] = name;
    map['url'] = url;
    return map;
  }

}