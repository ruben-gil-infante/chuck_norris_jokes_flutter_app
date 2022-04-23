class Joke {
  String createdAt = "";
  String iconUrl = "";
  String id = "";
  String updatedAt = "";
  String url = "";
  String value = "";

  Joke();

  Joke.fromJsonMap(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    iconUrl = json['icon_url'];
    id = json['id'];
    updatedAt = json['updatedAt'];
    url = json['url'];
    value = json['value'];
  }
}
