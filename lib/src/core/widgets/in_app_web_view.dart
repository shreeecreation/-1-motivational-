import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/route_manager.dart';
import '../theme/app_colors.dart';

class AppWebViewer extends StatefulWidget {
  const AppWebViewer({
    super.key,
    required this.url,
  });

  final Uri url;

  static const String path = '/web-viewer';

  @override
  State<AppWebViewer> createState() => _AppWebViewerState();
}

class _AppWebViewerState extends State<AppWebViewer> {
  final _isLoading = ValueNotifier<bool>(true);
  final _webTitle = ValueNotifier<String?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<String?>(
                valueListenable: _webTitle,
                builder: (context, webTitle, child) {
                  if (webTitle == null) {
                    return const SizedBox();
                  } else {
                    return Text(
                      webTitle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    );
                  }
                },
              ),
              Text(
                widget.url.origin,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 10),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: ValueListenableBuilder<bool>(
              valueListenable: _isLoading,
              builder: (context, isLoading, child) {
                return isLoading
                    ? const LinearProgressIndicator(
                        minHeight: 3,
                        color: AppColors.primary,
                      )
                    : const Divider(
                        height: 1,
                        thickness: 1,
                        color: AppColors.greyColor,
                      );
              },
            ),
          )),
      body: InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            userAgent: 'random',
            javaScriptEnabled: true,
            useShouldOverrideUrlLoading: true,
          ),
          android: AndroidInAppWebViewOptions(
            useHybridComposition: true,
          ),
        ),
        initialUrlRequest: URLRequest(url: WebUri(widget.url.path)),
        onProgressChanged: (controller, progress) {
          if (progress == 100) {
            _isLoading.value = false;
          }
        },
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          final url = navigationAction.request.url.toString();
          final uri = Uri.parse(url);
          // print(uri.data);
          // auth/oauth2-redirect-success

          if (uri.pathSegments.contains('oauth2-redirect-success')) {
            Get.back();
            return NavigationActionPolicy.CANCEL;
          }

          // // auth/oauth2-redirect-success
          // if (uri.pathSegments.contains('auth') &&
          //     uri.pathSegments.contains('oauth2-redirect-success')) {
          //   Navigator.of(context).pop(uri);
          //   return NavigationActionPolicy.CANCEL;
          // }

          // if (navigationAction.request.url.pathSegments.contains('auth') &&
          //     navigationAction.request.url.pathSegments.contains('oauth2-redirect-success')) {
          //   Navigator.of(context).pop(navigationAction.request.url);
          //   return NavigationActionPolicy.CANCEL;
          // }

          return NavigationActionPolicy.ALLOW;
        },
        onLoadStart: (controller, url) async {
          final doc = await controller.getHtml();
          // find title
          if (doc != null) {
            final title = doc.split('<title>')[1].split('</title>')[0].replaceAll('\n', '');
            _webTitle.value = title;
          }
        },
      ),
    );
  }
}
