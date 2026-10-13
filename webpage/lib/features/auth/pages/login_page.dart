import 'package:blogger_theme/blogger_theme.dart';

/// Renders the login page section — a centered card with email/password form.
Component loginPage() {
  return div(
    {'id': 'login-page', 'class': 'hidden'},
    [
      div(
        {
          'class':
              'relative flex flex-col items-center justify-center min-h-screen pt-[72px]',
        },
        [
          // Background decoration
          div(
            {'class': 'absolute inset-0 overflow-hidden pointer-events-none'},
            [
              div({
                'class':
                    'absolute -top-40 -right-40 w-80 h-80 bg-primary-500/10 rounded-full blur-3xl',
              }, []),
              div({
                'class':
                    'absolute -bottom-40 -left-40 w-80 h-80 bg-accent-500/10 rounded-full blur-3xl',
              }, []),
            ],
          ),
          // Login card
          div(
            {'class': 'relative w-full max-w-md px-6'},
            [
              div(
                {'class': 'card'},
                [
                  div(
                    {'class': 'card-body gap-5'},
                    [
                      // Header
                      div(
                        {'class': 'text-center'},
                        [
                          h2(
                            {
                              'class':
                                  'text-2xl font-extrabold text-surface-900 dark:text-white mb-2',
                            },
                            [Text('Welcome back')],
                          ),
                          p(
                            {
                              'class':
                                  'text-sm text-surface-500 dark:text-surface-400',
                            },
                            [Text('Sign in to your account to continue.')],
                          ),
                        ],
                      ),
                      // Email field
                      div(
                        {'class': 'flex flex-col gap-2'},
                        [
                          label(
                            {
                              'for': 'login-email',
                              'class':
                                  'text-sm font-semibold text-surface-700 dark:text-surface-300',
                            },
                            [Text('Email')],
                          ),
                          input({
                            'type': 'email',
                            'id': 'login-email',
                            'name': 'email',
                            'placeholder': 'you@example.com',
                            'class':
                                'w-full px-4 py-3 rounded-xl border border-surface-200 dark:border-surface-700 bg-surface-50 dark:bg-surface-800 text-surface-900 dark:text-white placeholder-surface-400 dark:placeholder-surface-500 focus:outline-none focus:ring-2 focus:ring-primary-500 transition-all duration-200',
                            'autocomplete': 'email',
                          }),
                        ],
                      ),
                      // Password field
                      div(
                        {'class': 'flex flex-col gap-2'},
                        [
                          label(
                            {
                              'for': 'login-password',
                              'class':
                                  'text-sm font-semibold text-surface-700 dark:text-surface-300',
                            },
                            [Text('Password')],
                          ),
                          input({
                            'type': 'password',
                            'id': 'login-password',
                            'name': 'password',
                            'placeholder': 'Enter your password',
                            'class':
                                'w-full px-4 py-3 rounded-xl border border-surface-200 dark:border-surface-700 bg-surface-50 dark:bg-surface-800 text-surface-900 dark:text-white placeholder-surface-400 dark:placeholder-surface-500 focus:outline-none focus:ring-2 focus:ring-primary-500 transition-all duration-200',
                            'autocomplete': 'current-password',
                          }),
                        ],
                      ),
                      // Error message container
                      div({'id': 'login-error', 'class': 'hidden'}, []),
                      // Sign in button
                      button(
                        {'id': 'login-btn', 'class': 'btn-primary w-full'},
                        [Text('Sign in')],
                      ),
                      // Divider
                      div(
                        {'class': 'flex items-center gap-3 my-2'},
                        [
                          div({
                            'class':
                                'flex-1 h-px bg-surface-200 dark:bg-surface-700',
                          }, []),
                          span(
                            {
                              'class':
                                  'text-xs text-surface-400 dark:text-surface-500 uppercase tracking-wide',
                            },
                            [Text('or')],
                          ),
                          div({
                            'class':
                                'flex-1 h-px bg-surface-200 dark:bg-surface-700',
                          }, []),
                        ],
                      ),
                      // Sign up link
                      p(
                        {
                          'class':
                              'text-center text-sm text-surface-500 dark:text-surface-400',
                        },
                        [
                          Text('Don\'t have an account? '),
                          a(
                            {
                              'href': '#',
                              'id': 'go-to-signup',
                              'class':
                                  'text-primary-600 dark:text-primary-400 font-semibold no-underline hover:underline transition-all duration-200',
                            },
                            [Text('Sign up')],
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
