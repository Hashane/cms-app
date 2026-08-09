import 'package:cms/core/api/api_client.dart';
import 'package:cms/models/menu_node.dart';
import 'package:cms/models/public_page.dart';

class CmsRepository {
  Future<List<MenuNode>> fetchMenu() async {
    final response = await dio.get('/public/menu');
    final data = response.data['data'] as List<dynamic>;
    return data
        .map((json) => MenuNode.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<PublicPage> fetchPage(String slug) async {
    final response = await dio.get('/public/pages/$slug');
    final data = response.data['data'] as Map<String, dynamic>;
    return PublicPage.fromJson(data);
  }
}
