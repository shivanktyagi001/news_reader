class NewsModel {
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? image;
  final DateTime publishedAt;
  final String? content;
  final String sourceName;

  NewsModel({
    required this.title,
    required this.url,
    required this.publishedAt,
    required this.sourceName,
    this.author,
    this.description,
    this.image,
    this.content,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      author: json['author'],
      title: json['title'] ?? '',
      description: json['description'],
      url: json['url'] ?? '',
      image: json['urlToImage'],
      publishedAt: DateTime.tryParse(json['publishedAt'] ?? '') ?? DateTime.now(),
      content: json['content'],
      sourceName: json['source']?['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'image': image,
      'publishedAt': publishedAt.toIso8601String(),
      'content': content,
      'source': {'name': sourceName},
    };
  }
}
