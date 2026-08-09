import 'package:cms/core/providers/cms_provider.dart';
import 'package:cms/models/menu_node.dart';
import 'package:cms/screens/page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menuAsyncValue = ref.watch(menuProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Menu Screen')),
      body: menuAsyncValue.when(
        data: (menu) => ListView(
          children: [for (final node in menu) _MenuNodeTile(node: node)],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Failed to load menu: $err')),
      ),
    );
  }
}

class _MenuNodeTile extends StatelessWidget {
  final MenuNode node;
  final int depth;

  const _MenuNodeTile({required this.node, this.depth = 0});

  @override
  Widget build(BuildContext context) {
    final isPage = node.itemType == 'page' && node.page != null;

    return Padding(
      padding: EdgeInsets.only(left: depth * 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: isPage
                ? InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PageScreen(slug: node.page!.slug),
                      ),
                    ),
                    child: Text(
                      node.page!.title,
                      style: const TextStyle(color: Colors.blue),
                    ),
                  )
                : Text(node.label),
          ),
          for (final child in node.children)
            _MenuNodeTile(node: child, depth: depth + 1),
        ],
      ),
    );
  }
}
