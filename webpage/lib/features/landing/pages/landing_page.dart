import 'package:blogger_theme/blogger_theme.dart';

/// Renders the top navigation bar.
/// Shows Login / Signup when not authenticated, user email + Sign out when authenticated.
Component navbar() {
  return header(
    {'class': 'navbar'},
    [
      div(
        {'class': 'nav-container'},
        [
          // Left side — logo
          div(
            {'class': 'nav-left'},
            [
              a(
                {'href': '#', 'id': 'nav-logo', 'class': 'logo'},
                [
                  div(
                    {
                      'class':
                          'logo-box bg-gradient-to-br from-primary-500 to-accent-500',
                    },
                    [
                      span(
                        {'class': 'text-white text-sm font-bold'},
                        [Text('W')],
                      ),
                    ],
                  ),
                  span({'class': 'logo-text'}, [Text('Website')]),
                ],
              ),
            ],
          ),
          // Center — desktop links
          nav(
            {'class': 'desktop-links'},
            [
              a(
                {'href': '#', 'id': 'nav-home', 'class': 'nav-item-active'},
                [Text('Home')],
              ),
            ],
          ),
          // Right side — auth actions
          div(
            {'class': 'actions-group'},
            [
              // Dark mode toggle
              button(
                {
                  'id': 'dark-mode-toggle',
                  'class': 'icon-btn',
                  'type': 'button',
                  'title': 'Toggle dark mode',
                },
                [
                  span({'class': 'i-carbon-moon text-lg'}, []),
                ],
              ),
              // Not authenticated: show Login and Signup
              div(
                {'id': 'auth-actions-logged-out'},
                [
                  a(
                    {
                      'href': '#',
                      'id': 'nav-login',
                      'class': 'btn-ghost text-sm',
                    },
                    [Text('Log in')],
                  ),
                  a(
                    {
                      'href': '#',
                      'id': 'nav-signup',
                      'class': 'btn-primary text-sm py-2 px-4',
                    },
                    [Text('Sign up')],
                  ),
                ],
              ),
              // Authenticated: show user email and sign out
              div(
                {
                  'id': 'auth-actions-logged-in',
                  'class': 'hidden flex items-center gap-3',
                },
                [
                  span({
                    'id': 'user-email',
                    'class':
                        'text-sm text-surface-600 dark:text-surface-300 font-medium',
                  }, []),
                  button(
                    {'id': 'nav-signout', 'class': 'btn-ghost text-sm'},
                    [Text('Sign out')],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

/// Renders the main landing / hero section of the home page.
Component landingHero() {
  return div(
    {'id': 'home-page'},
    [
      div(
        {
          'class':
              'hero flex flex-col items-center justify-center min-h-screen pt-[72px]',
        },
        [
          div(
            {'class': 'section-container flex flex-col items-center max-w-3xl'},
            [
              // Badge
              div(
                {'class': 'section-badge mb-6'},
                [
                  span({'class': 'i-carbon-moon text-sm'}, []),
                  Text('Powered by Serverpod'),
                ],
              ),
              // Title
              h1(
                {'class': 'hero-title mb-6'},
                [
                  Text('Build something '),
                  span({'class': 'gradient-text'}, [Text('amazing')]),
                  Text('.'),
                ],
              ),
              // Subtitle
              p(
                {'class': 'hero-subtitle mb-10'},
                [
                  Text(
                    'A modern web application built with Serverpod and Flutter. '
                    'Sign up to get started and explore what you can build.',
                  ),
                ],
              ),
              // CTA buttons
              div(
                {'class': 'flex flex-wrap items-center justify-center gap-4'},
                [
                  a(
                    {
                      'href': '#',
                      'id': 'hero-signup',
                      'class': 'btn-primary text-base',
                    },
                    [Text('Get started')],
                  ),
                  a(
                    {
                      'href': '#',
                      'id': 'hero-login',
                      'class': 'btn-secondary text-base',
                    },
                    [Text('Log in')],
                  ),
                ],
              ),
              // Features section
              div(
                {
                  'class':
                      'grid grid-cols-1 md:grid-cols-3 gap-6 mt-20 w-full max-w-4xl',
                },
                [
                  // Feature 1
                  div(
                    {'class': 'card'},
                    [
                      div(
                        {'class': 'card-body items-center text-center'},
                        [
                          div(
                            {
                              'class':
                                  'w-12 h-12 rounded-xl bg-primary-100 dark:bg-primary-900/30 flex items-center justify-center mb-4',
                            },
                            [
                              span({'class': 'text-2xl'}, [Text('⚡')]),
                            ],
                          ),
                          h3(
                            {
                              'class':
                                  'text-lg font-bold text-surface-900 dark:text-white mb-2',
                            },
                            [Text('Lightning Fast')],
                          ),
                          p(
                            {
                              'class':
                                  'text-sm text-surface-500 dark:text-surface-400',
                            },
                            [
                              Text(
                                'Built on Serverpod for blazing-fast API responses and real-time updates.',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Feature 2
                  div(
                    {'class': 'card'},
                    [
                      div(
                        {'class': 'card-body items-center text-center'},
                        [
                          div(
                            {
                              'class':
                                  'w-12 h-12 rounded-xl bg-accent-100 dark:bg-accent-900/30 flex items-center justify-center mb-4',
                            },
                            [
                              span({'class': 'text-2xl'}, [Text('🔒')]),
                            ],
                          ),
                          h3(
                            {
                              'class':
                                  'text-lg font-bold text-surface-900 dark:text-white mb-2',
                            },
                            [Text('Secure Auth')],
                          ),
                          p(
                            {
                              'class':
                                  'text-sm text-surface-500 dark:text-surface-400',
                            },
                            [
                              Text(
                                'Email-based authentication with JWT tokens, built right in.',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Feature 3
                  div(
                    {'class': 'card'},
                    [
                      div(
                        {'class': 'card-body items-center text-center'},
                        [
                          div(
                            {
                              'class':
                                  'w-12 h-12 rounded-xl bg-primary-100 dark:bg-primary-900/30 flex items-center justify-center mb-4',
                            },
                            [
                              span({'class': 'text-2xl'}, [Text('🎨')]),
                            ],
                          ),
                          h3(
                            {
                              'class':
                                  'text-lg font-bold text-surface-900 dark:text-white mb-2',
                            },
                            [Text('Modern Design')],
                          ),
                          p(
                            {
                              'class':
                                  'text-sm text-surface-500 dark:text-surface-400',
                            },
                            [
                              Text(
                                'Beautiful UI with dark mode support and responsive layouts.',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

/// Renders the footer section.
Component pageFooter() {
  return div(
    {'class': 'footer'},
    [
      div(
        {'class': 'section-container flex flex-col items-center text-center'},
        [
          p(
            {'class': 'text-sm text-surface-500 dark:text-surface-400'},
            [
              Text('© 2025 Website. Built with '),
              span(
                {
                  'class':
                      'font-semibold text-surface-700 dark:text-surface-300',
                },
                [Text('Serverpod')],
              ),
              Text(' and '),
              span(
                {
                  'class':
                      'font-semibold text-surface-700 dark:text-surface-300',
                },
                [Text('Flutter')],
              ),
              Text('.'),
            ],
          ),
        ],
      ),
    ],
  );
}
