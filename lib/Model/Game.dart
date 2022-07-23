class Game{
  int id;
  String title;
  String thumbnail;
  String short_description;
  String genre;
  String game_url;
  String platform;
  String developer;

  Game(this.id, this.title, this.thumbnail, this.short_description, this.genre,
      this.game_url, this.platform, this.developer);

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
        json["id"],
        json["title"],
        json["thumbnail"],
        json["short_description"],
        json["genre"],
        json["game_url"],
        json["platform"],
        json["developer"]
        );
  }
}