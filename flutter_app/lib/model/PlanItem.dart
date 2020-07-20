class PlanItem{

  String trainplan_id;
  String trainplan_name;
  String trainplan_img;
  String valid_start_time;
  String valid_end_time;
  int finish_progress;

  PlanItem(this.trainplan_id,this.trainplan_name,this.trainplan_img,this.valid_start_time,this.valid_end_time,this.finish_progress);

  PlanItem.formJson(Map<String,dynamic> json)
      :this(
      json["trainplan_id"],
      json["trainplan_name"],
      json["trainplan_img"],
      json["valid_start_time"],
      json["valid_end_time"],
      json["finish_progress"]
  );

  Map<String,dynamic> toJson(){
    return {"trainplan_id":trainplan_id,"trainplan_name":trainplan_name,"trainplan_img":trainplan_img,"valid_start_time":valid_start_time,"valid_end_time":valid_end_time,"finish_progress":finish_progress};
  }
}