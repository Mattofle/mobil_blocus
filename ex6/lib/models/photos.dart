class Photos{
  static const base_url = 'https://unreal-api.azurewebsites.net/photos';


  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photos({
    this.id = -1,
    this.title = "no title",
    this.url = "no url",
    this.thumbnailUrl = "no thumbnailUrl"
  });

  factory Photos.fromJson(Map<String, dynamic> json){
    return Photos(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      url: json['url'] ?? "",
      thumbnailUrl: json['thumbnailUrl'] ?? ""
    );
  }
}