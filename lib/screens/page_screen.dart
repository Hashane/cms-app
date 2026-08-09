import 'package:cms/core/providers/cms_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageScreen extends ConsumerWidget {
  final String slug;
  const PageScreen({super.key, required this.slug});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageAsyncValue = ref.watch(pageProvider(slug));

    return Scaffold(
      appBar: AppBar(title: Text('Page Screen')),
      body: pageAsyncValue.when(
        data: (page) => Column(
          children: [
            Text('Title: ${page.title}'),
            Text('Content: ${page.bodyHtml}'),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => const Center(child: Text('Failed to load page')),
      ),
    );
  }
}
