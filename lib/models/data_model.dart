class DataModel {
  String? mealtime;
  Option1? option1;
  Option1? option2;
  Option1? fancy;

  DataModel({this.mealtime, this.option1, this.option2, this.fancy});

  DataModel.fromJson(Map<String, dynamic> json) {
    mealtime = json['mealtime'];
    option1 = json['option_1'] != null
        ? Option1.fromJson(json['option_1'])
        : null;
    option2 = json['option_2'] != null
        ? Option1.fromJson(json['option_2'])
        : null;
    fancy = json['fancy'] != null ? Option1.fromJson(json['fancy']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mealtime'] = mealtime;
    if (option1 != null) {
      data['option_1'] = option1!.toJson();
    }
    if (option2 != null) {
      data['option_2'] = option2!.toJson();
    }
    if (fancy != null) {
      data['fancy'] = fancy!.toJson();
    }
    return data;
  }
}

class Option1 {
  int? id;
  String? name;
  String? mainImg;
  String? img1;
  String? img2;
  String? img3;

  Option1({this.id, this.name, this.mainImg, this.img1, this.img2, this.img3});

  Option1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mainImg = json['main_img'];
    img1 = json['img_1'];
    img2 = json['img_2'];
    img3 = json['img_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['main_img'] = mainImg;
    data['img_1'] = img1;
    data['img_2'] = img2;
    data['img_3'] = img3;
    return data;
  }
}