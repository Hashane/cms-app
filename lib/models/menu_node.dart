class MenuPage {
  final String slug;
  final String title;

  MenuPage({required this.slug, required this.title});

  factory MenuPage.fromJson(Map<String, dynamic> json) {
    return MenuPage(slug: json['slug'], title: json['title']);
  }
}

class MenuNode {
  final int id;
  final String label;
  final String itemType;
  final MenuPage? page;
  final List<MenuNode> children;

  MenuNode({
    required this.id,
    required this.label,
    required this.itemType,
    this.page,
    required this.children,
  });

  factory MenuNode.fromJson(Map<String, dynamic> json) {
    return MenuNode(
      id: json['id'],
      label: json['label'],
      itemType: json['item_type'],
      page: json['page'] != null ? MenuPage.fromJson(json['page']) : null,
      children: (json['children'] as List<dynamic>)
          .map((childJson) => MenuNode.fromJson(childJson))
          .toList(),
    );
  }
}
