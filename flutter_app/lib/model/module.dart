class ModuleList {
  int code;
  String msg;
  Result result;

  ModuleList({this.code, this.msg, this.result});

  ModuleList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    result = json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  String modules;
  List<NavModules> navModules;
  HomeModulesReal homeModulesReal;
  List<HomeModules> homeModules;

  Result({this.modules, this.navModules, this.homeModulesReal, this.homeModules});

  Result.fromJson(Map<String, dynamic> json) {
    modules = json['modules'];
    if (json['nav_modules'] != null) {
      navModules = new List<NavModules>();
      json['nav_modules'].forEach((v) { navModules.add(new NavModules.fromJson(v)); });
    }
    homeModulesReal = json['home_modules_real'] != null ? new HomeModulesReal.fromJson(json['home_modules_real']) : null;
    if (json['home_modules'] != null) {
      homeModules = new List<HomeModules>();
      json['home_modules'].forEach((v) { homeModules.add(new HomeModules.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['modules'] = this.modules;
    if (this.navModules != null) {
      data['nav_modules'] = this.navModules.map((v) => v.toJson()).toList();
    }
    if (this.homeModulesReal != null) {
      data['home_modules_real'] = this.homeModulesReal.toJson();
    }
    if (this.homeModules != null) {
      data['home_modules'] = this.homeModules.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NavModules {
  String name;
  String nameEn;
  String img;
  String id;
  String nameCn;

  NavModules({this.name, this.nameEn, this.img, this.id, this.nameCn});

  NavModules.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameEn = json['name_en'];
    img = json['img'];
    id = json['id'];
    nameCn = json['name_cn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    data['img'] = this.img;
    data['id'] = this.id;
    data['name_cn'] = this.nameCn;
    return data;
  }
}

class HomeModulesReal {
  LearnMap learnMap;
  int learnProject;
  Trainplan trainplan;
  int integralRank;
  int liveBroadcast;
  int comment;
  int creditRank;
  int knowledge;
  int column;
  int option;

  HomeModulesReal({this.learnMap, this.learnProject, this.trainplan, this.integralRank, this.liveBroadcast, this.comment, this.creditRank, this.knowledge, this.column, this.option});

  HomeModulesReal.fromJson(Map<String, dynamic> json) {
    learnMap = json['learnMap'] != null ? new LearnMap.fromJson(json['learnMap']) : null;
    learnProject = json['learnProject'];
    trainplan = json['trainplan'] != null ? new Trainplan.fromJson(json['trainplan']) : null;
    integralRank = json['integralRank'];
    liveBroadcast = json['liveBroadcast'];
    comment = json['comment'];
    creditRank = json['creditRank'];
    knowledge = json['knowledge'];
    column = json['column'];
    option = json['option'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.learnMap != null) {
      data['learnMap'] = this.learnMap.toJson();
    }
    data['learnProject'] = this.learnProject;
    if (this.trainplan != null) {
      data['trainplan'] = this.trainplan.toJson();
    }
    data['integralRank'] = this.integralRank;
    data['liveBroadcast'] = this.liveBroadcast;
    data['comment'] = this.comment;
    data['creditRank'] = this.creditRank;
    data['knowledge'] = this.knowledge;
    data['column'] = this.column;
    data['option'] = this.option;
    return data;
  }
}

class LearnMap {
  int dailyReflect;
  int hot;

  LearnMap({this.dailyReflect, this.hot});

LearnMap.fromJson(Map<String, dynamic> json) {
dailyReflect = json['dailyReflect'];
hot = json['hot'];
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['dailyReflect'] = this.dailyReflect;
  data['hot'] = this.hot;
  return data;
}
}

class Trainplan {
  int necPlan;
  int optPlan;

  Trainplan({this.necPlan, this.optPlan});

  Trainplan.fromJson(Map<String, dynamic> json) {
    necPlan = json['necPlan'];
    optPlan = json['optPlan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['necPlan'] = this.necPlan;
    data['optPlan'] = this.optPlan;
    return data;
  }
}

class HomeModules {
  String name;
  String nameEn;
  List<Child> child;
  String tag;
  int isChecked;

  HomeModules({this.name, this.nameEn, this.child, this.tag, this.isChecked});

  HomeModules.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameEn = json['name_en'];
    if (json['child'] != null) {
      child = new List<Child>();
      json['child'].forEach((v) { child.add(new Child.fromJson(v)); });
    }
    tag = json['tag'];
    isChecked = json['is_checked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    if (this.child != null) {
      data['child'] = this.child.map((v) => v.toJson()).toList();
    }
    data['tag'] = this.tag;
    data['is_checked'] = this.isChecked;
    return data;
  }
}

class Child {
  String name;
  String nameEn;
  int isChecked;
  String tag;

  Child({this.name, this.nameEn, this.isChecked, this.tag});

  Child.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    nameEn = json['name_en'];
    isChecked = json['is_checked'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    data['is_checked'] = this.isChecked;
    data['tag'] = this.tag;
    return data;
  }
}
