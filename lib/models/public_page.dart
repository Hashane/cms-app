class PublicPage {
  final String title;
  final String slug;
  final String bodyHtml;
  final String? coverImageUrl;
  final String? publishedAt;

  PublicPage({
    required this.title,
    required this.slug,
    required this.bodyHtml,
    this.coverImageUrl,
    this.publishedAt,
  });

  factory PublicPage.fromJson(Map<String, dynamic> json) {
    return PublicPage(
      title: json['title'],
      slug: json['slug'],
      bodyHtml: json['body_html'],
      coverImageUrl: json['cover_image_url'],
      publishedAt: json['published_at'],
    );
  }
}
