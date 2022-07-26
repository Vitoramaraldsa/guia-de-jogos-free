class New{
  String title;
  String link;

  New(this.title, this.link);

  factory New.fromJson(Map<String, dynamic> json){
    return New(
        json["title"],
        json["url"]
    );
  }
}