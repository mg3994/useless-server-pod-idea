import 'dart:async';
import 'dart:js_interop';

import 'package:web/web.dart' as web;

/// Manages the YouTube-style bottom connectivity snackbar.
class ConnectivitySnackbar {
  final web.HTMLDivElement? _snackbar;
  final web.HTMLDivElement? _content;
  final web.HTMLSpanElement? _icon;
  final web.HTMLSpanElement? _text;
  final web.HTMLButtonElement? _dismissBtn;

  Timer? _autoDismissTimer;

  ConnectivitySnackbar()
    : _snackbar = web.document.querySelector(
        '#connectivity-snackbar',
      ) as web.HTMLDivElement?,
      _content = web.document.querySelector(
        '#snackbar-content',
      ) as web.HTMLDivElement?,
      _icon =
          web.document.querySelector('#snackbar-icon') as web.HTMLSpanElement?,
      _text =
          web.document.querySelector('#snackbar-text') as web.HTMLSpanElement?,
      _dismissBtn = web.document.querySelector(
        '#snackbar-dismiss',
      ) as web.HTMLButtonElement?;

  void setup() {
    _dismissBtn?.addEventListener(
      'click',
      ((web.Event _) {
        hide();
      }).toJS,
    );
  }

  void showOffline() {
    _autoDismissTimer?.cancel();
    _content?.classList.remove('bg-green-800');
    _content?.classList.add('bg-red-700');
    _icon?.textContent = '📡';
    _text?.textContent = 'No internet connection';
    _dismissBtn?.textContent = 'DISMISS';
    _dismissBtn?.style.display = '';
    _show();
  }

  void showBackOnline() {
    _content?.classList.remove('bg-red-700');
    _content?.classList.add('bg-green-800');
    _icon?.textContent = '📶';
    _text?.textContent = 'Back online';
    _dismissBtn?.textContent = 'DISMISS';
    _dismissBtn?.style.display = 'none';
    _show();

    _autoDismissTimer?.cancel();
    _autoDismissTimer = Timer(const Duration(seconds: 3), () {
      hide();
    });
  }

  void hide() {
    _autoDismissTimer?.cancel();
    _snackbar?.style.transform = 'translateY(100%)';
  }

  void _show() {
    _snackbar?.style.transform = 'translateY(0)';
  }

  void dispose() {
    _autoDismissTimer?.cancel();
  }
}

/// Sets up the connectivity snackbar to listen to browser online/offline events.
ConnectivitySnackbar setupConnectivitySnackbar() {
  final snackbar = ConnectivitySnackbar();
  snackbar.setup();

  bool isConnected = true;
  try {
    isConnected = web.window.navigator.onLine as bool? ?? true;
  } catch (_) {
    // Fallback if onLine is not available
  }
  if (!isConnected) {
    snackbar.showOffline();
  }

  late final JSFunction onOnlineHandler;
  late final JSFunction onOfflineHandler;

  onOnlineHandler = ((web.Event event) {
    if (isConnected == false) {
      snackbar.showBackOnline();
    }
    isConnected = true;
  }).toJS;

  onOfflineHandler = ((web.Event event) {
    if (isConnected == true) {
      snackbar.showOffline();
    }
    isConnected = false;
  }).toJS;

  web.window.addEventListener('online', onOnlineHandler);
  web.window.addEventListener('offline', onOfflineHandler);

  return snackbar;
}
