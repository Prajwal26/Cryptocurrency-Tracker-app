class NewsModel {


  String guid;
  int published_on;
  String imageURL;
  String title;
  String url;
  String source;
  String body;
  String name;
  String img;

  NewsModel(this.guid, this.published_on, this.imageURL, this.title, this.url,
      this.source, this.body, this.name, this.img);

  factory NewsModel.fromJSON(Map<String, dynamic> json) {
    return NewsModel(
        json["guid"],
        json["published_on"],
        json["imageurl"],
        json["title"],
        json["url"],
        json["source"],
        json["body"],
        json["source_info"]["name"],
        json["source_info"]["img"]);
  }
}
