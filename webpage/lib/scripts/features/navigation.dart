import 'package:web/web.dart' as web;

/// Simple SPA-style page router.
/// Shows one page at a time by toggling the `hidden` class.
class PageRouter {
  static const _pageIds = ['home-page', 'login-page', 'signup-page'];

  /// Shows the page with the given [id] and hides all others.
  void navigateTo(String id) {
    for (final pageId in _pageIds) {
      final el = web.document.querySelector('#$pageId');
      if (el == null) continue;
      if (pageId == id) {
        el.classList.remove('hidden');
      } else {
        el.classList.add('hidden');
      }
    }
    // Scroll to top
    web.document.documentElement?.scrollTop = 0;
  }
}
