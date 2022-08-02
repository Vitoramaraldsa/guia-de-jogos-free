class New{
  String title;
  String link;

  New(this.title, this.link);

  factory New.fromJson(Map<String, dynamic> json){
    if(json["title"]==null){
      return New(
          json["texto"] = "texto",
          json["url"]
      );

    }else{
      return New(
          json["title"],
          json["url"]
      );
    }

  }
}