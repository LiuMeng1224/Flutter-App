class BannerItem{

  final String id;
  final String title;
  final String img;
  final String url;
  // ignore: non_constant_identifier_names
  final int is_outside_url;

  BannerItem(this.id, this.title, this.img, this.url, this.is_outside_url);

  BannerItem.formJson(Map<String,dynamic> json)
  :this(
    json["id"],
    json["title"],
    json["img"],
    json["url"],
    json["is_outside_url"]
  );

  Map<String,dynamic> toJson(){

    return {"id":id,"title":title,"img":img,"url":url,"is_outside_url":is_outside_url};
  }
}