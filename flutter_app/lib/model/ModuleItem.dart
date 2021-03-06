class ModuleItem{
  String name;
  String name_en;
  String id;
  String name_cn;
  String img;

  ModuleItem(this.name,this.name_en,this.id,this.name_cn,this.img);

  ModuleItem.formJson(Map<String,dynamic> json)
      :this(
      json["name"],
      json["name_en"],
      json["id"],
      json["name_cn"],
      json["img"]
  );

  Map<String,dynamic> toJson(){
    return {"name":name,"name_en":name_en,"id":id,"name_cn":name_cn,"img":img};
  }

}