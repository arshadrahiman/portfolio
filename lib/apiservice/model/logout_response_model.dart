class LogoutResponseModel {
  Result? result;

  LogoutResponseModel({this.result});

  LogoutResponseModel.fromJson(Map<dynamic, dynamic> json) {
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? status;
  String? message;
  // List<String>? data;

  Result({
    this.status,
    this.message,
  });

  Result.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    // data['data'] = this.data;
    return data;
  }
}
