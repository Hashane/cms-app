import 'package:cms/core/providers/cms_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
        data: (page) {
          debugPrint(page.coverImageUrl);
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (page.coverImageUrl != null) ...[
                  Image.network(
                    page.coverImageUrl!,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 12),
                ],
                Text('Title: ${page.title}'),
                Html(data: page.bodyHtml),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Failed to load menu: $err')),
      ),
    );
  }
}
