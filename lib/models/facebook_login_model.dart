class FacebookAccount {
  String? name;
  String? email;
  Picture? picture;
  String? id;

  FacebookAccount.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    id = json["id"];
    picture =
        json["picture"] != null ? Picture.fromJson(json["picture"]) : null;
  }
}

class Picture {
  PictureData? data;

  Picture.fromJson(Map<String, dynamic> json) {
    data = json["data"] != null ? PictureData.fromJson(json["data"]) : null;
  }
}

class PictureData {
  double? width;
  double? height;
  String? url;

  PictureData.fromJson(Map<String, dynamic> json) {
    width = json["width"];
    height = json["height"];
    url = json["url"];
  }
}
