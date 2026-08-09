import 'package:cms/core/api/cms_repository.dart';
import 'package:cms/models/menu_node.dart';
import 'package:cms/models/public_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final menuProvider = FutureProvider<List<MenuNode>>((ref) async {
  return await CmsRepository().fetchMenu();
});

final pageProvider = FutureProvider.family<PublicPage, String>((
  ref,
  slug,
) async {
  return await CmsRepository().fetchPage(slug);
});
