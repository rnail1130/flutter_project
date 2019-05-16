class DataListEntity {
  DataListD d;

  DataListEntity({this.d});

  DataListEntity.fromJson(Map<String, dynamic> json) {
    d = json['d'] != null ? new DataListD.fromJson(json['d']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.d != null) {
      data['d'] = this.d.toJson();
    }
    return data;
  }
}

class DataListD {
  dynamic msg;
  int code;
  List<DataListDResult> result;

  DataListD({this.msg, this.code, this.result});

  DataListD.fromJson(Map<String, dynamic> json) {
    msg = json['Msg'];
    code = json['Code'];
    if (json['Result'] != null) {
      result = new List<DataListDResult>();(json['Result'] as List).forEach((v) { result.add(new DataListDResult.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Msg'] = this.msg;
    data['Code'] = this.code;
    if (this.result != null) {
      data['Result'] =  this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataListDResult {
  String sType;
  String cite;
  String title;
  String imageUrl;
  int id;
  String dateTime;

  DataListDResult({this.sType, this.cite, this.title, this.imageUrl, this.id, this.dateTime});

  DataListDResult.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    cite = json['Cite'];
    title = json['Title'];
    imageUrl = json['ImageUrl'];
    id = json['Id'];
    dateTime = json['DateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['__type'] = this.sType;
    data['Cite'] = this.cite;
    data['Title'] = this.title;
    data['ImageUrl'] = this.imageUrl;
    data['Id'] = this.id;
    data['DateTime'] = this.dateTime;
    return data;
  }
}
