class MasakanModel {
  String? title;
  String? thumb;
  String? key;
  String? times;
  String? serving;
  String? difficulty;

  MasakanModel({
    this.title,
    this.thumb,
    this.key,
    this.times,
    this.serving,
    this.difficulty,
  });

  factory MasakanModel.fromJson(Map<String, dynamic> json) => MasakanModel(
        title: json["title"],
        thumb: json["thumb"],
        key: json["key"],
        times: json["times"],
        serving: json["serving"],
        difficulty: json["difficulty"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "thumb": thumb,
        "key": key,
        "times": times,
        "serving": serving,
        "difficulty": difficulty,
      };

  static List<MasakanModel> fromJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => MasakanModel.fromJson(e)).toList();
  }
}
