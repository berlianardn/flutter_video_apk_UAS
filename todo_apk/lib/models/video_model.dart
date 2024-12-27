class Video {
  final String id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Video({
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  // Factory method to create a Video instance from a map (used for decoding API response)
  factory Video.fromMap(Map<String, dynamic> map) {
    return Video(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      url: map['url'] ?? '',
      thumbnailUrl: map['thumbnail_url'] ?? '',  // Add a default URL if it's not provided
    );
  }

  // Method to convert Video instance to a map (used for encoding before making requests)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'url': url,
      'thumbnail_url': thumbnailUrl,
    };
  }
}
