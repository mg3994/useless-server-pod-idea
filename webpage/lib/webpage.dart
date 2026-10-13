import 'dart:io';

import 'package:blogger_theme/blogger_theme.dart';
import 'package:path/path.dart' as path;

import 'features/auth/pages/login_page.dart' show loginPage;
import 'features/auth/pages/signup_page.dart' show signupPage;
import 'features/landing/pages/landing_page.dart'
    show landingHero, navbar, pageFooter;

/// Dark mode toggle script — runs immediately before any JS to avoid flash.
Component darkModeScript() {
  return script(
    {'type': 'text/javascript'},
    [
      Text(
        // this script is very small don't ever try to port it to dart as
        // dart scripts are bulky and we need faster native stuffs so.. keep it simple..
        escape: false,
        '''(function() { 
  const html = document.documentElement;
  const stored = localStorage.getItem('dark-mode');
  if (stored === 'true' || (!stored && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
    html.classList.add('amp-dark-mode');
  }
  const toggle = document.getElementById('dark-mode-toggle');
  if (toggle) {
    toggle.addEventListener('click', () => {
      html.classList.toggle('amp-dark-mode');
      localStorage.setItem('dark-mode', html.classList.contains('amp-dark-mode'));
    });
  }
})();''',
      ),
    ],
  );
}

/// Embeds the Serverpod client bootstrap script.
Component clientBootstrapScript() {
  return BClientScript(
    "lib/scripts/script.dart",
    attributes: {'type': 'text/javascript'},
    contentInCDATA: false,
  );
}

// ─── Full Page ──────────────────────────────────────────────────────────────

Component mainPage(String css) {
  return html(
    {'class': 'amp-dark-mode'},
    [
      head([
        meta({'charset': 'UTF-8'}),
        meta({
          'name': 'viewport',
          'content': 'width=device-width, initial-scale=1.0',
        }),
        meta({
          'name': 'description',
          'content':
              'A modern web application built with Serverpod and Flutter.',
        }),
        meta({'name': 'theme-color', 'content': '#0284c7'}),
        title([Text('Website')]),
        link({
          'rel': 'icon',
          'type': 'image/svg+xml',
          'href':
              'data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><text y=".9em" font-size="90">🚀</text></svg>',
        }),
        // UnoCSS generated styles
        style({'type': 'text/css'}, [Text(css, escape: false)]),
      ]),
      body([
        // Navigation bar
        navbar(),

        // Pages
        landingHero(),
        loginPage(),
        signupPage(),

        // Footer
        pageFooter(),

        // YouTube-style connectivity snackbar (hidden by default)
        div(
          {
            'id': 'connectivity-snackbar',
            'class':
                'fixed bottom-0 left-0 right-0 z-50 translate-y-full transition-transform duration-300',
          },
          [
            div(
              {
                'id': 'snackbar-content',
                'class':
                    'flex items-center justify-center gap-2.5 px-4 py-2.5 text-white text-sm font-medium',
              },
              [
                span({'id': 'snackbar-icon', 'class': 'text-base'}, []),
                span({'id': 'snackbar-text'}, [Text('')]),
                button(
                  {
                    'id': 'snackbar-dismiss',
                    'class':
                        'ml-4 text-xs font-bold uppercase tracking-wide opacity-80 hover:opacity-100',
                  },
                  [Text('DISMISS')],
                ),
              ],
            ),
          ],
        ),

        clientBootstrapScript(),
      ]),
    ],
  );
}

// ─── Public Entry Point ─────────────────────────────────────────────────────

/// Loads the CSS and returns the complete main page component.
Future<Component> main() async {
  // Resolve the CSS file path relative to this library file
  final scriptDir = path.dirname(path.fromUri(Platform.script));
  final cssPath = path.normalize(
    path.join(scriptDir, '..', 'lib', 'css', 'output.css'),
  );
  final cssFile = File(cssPath);

  String css = '';
  if (await cssFile.exists()) {
    css = await cssFile.readAsString();
  } else {
    // Fallback: try relative to current working directory
    final fallbackFile = File('lib/css/output.css');
    if (await fallbackFile.exists()) {
      css = await fallbackFile.readAsString();
    }
  }

  return mainPage(css);
}
