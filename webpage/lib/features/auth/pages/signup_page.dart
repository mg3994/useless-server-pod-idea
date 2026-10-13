import 'package:blogger_theme/blogger_theme.dart';

/// Renders the signup page section — a centered card with registration form.
Component signupPage() {
  return div(
    {'id': 'signup-page', 'class': 'hidden'},
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
                    'absolute -top-40 -left-40 w-80 h-80 bg-accent-500/10 rounded-full blur-3xl',
              }, []),
              div({
                'class':
                    'absolute -bottom-40 -right-40 w-80 h-80 bg-primary-500/10 rounded-full blur-3xl',
              }, []),
            ],
          ),
          // Signup card
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
                            [Text('Create account')],
                          ),
                          p(
                            {
                              'class':
                                  'text-sm text-surface-500 dark:text-surface-400',
                            },
                            [Text('Sign up to get started with your account.')],
                          ),
                        ],
                      ),
                      // Name field
                      div(
                        {'class': 'flex flex-col gap-2'},
                        [
                          label(
                            {
                              'for': 'signup-name',
                              'class':
                                  'text-sm font-semibold text-surface-700 dark:text-surface-300',
                            },
                            [Text('Full name')],
                          ),
                          input({
                            'type': 'text',
                            'id': 'signup-name',
                            'name': 'name',
                            'placeholder': 'John Doe',
                            'class':
                                'w-full px-4 py-3 rounded-xl border border-surface-200 dark:border-surface-700 bg-surface-50 dark:bg-surface-800 text-surface-900 dark:text-white placeholder-surface-400 dark:placeholder-surface-500 focus:outline-none focus:ring-2 focus:ring-primary-500 transition-all duration-200',
                            'autocomplete': 'name',
                          }),
                        ],
                      ),
                      // Email field
                      div(
                        {'class': 'flex flex-col gap-2'},
                        [
                          label(
                            {
                              'for': 'signup-email',
                              'class':
                                  'text-sm font-semibold text-surface-700 dark:text-surface-300',
                            },
                            [Text('Email')],
                          ),
                          input({
                            'type': 'email',
                            'id': 'signup-email',
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
                              'for': 'signup-password',
                              'class':
                                  'text-sm font-semibold text-surface-700 dark:text-surface-300',
                            },
                            [Text('Password')],
                          ),
                          input({
                            'type': 'password',
                            'id': 'signup-password',
                            'name': 'password',
                            'placeholder': 'Create a password',
                            'class':
                                'w-full px-4 py-3 rounded-xl border border-surface-200 dark:border-surface-700 bg-surface-50 dark:bg-surface-800 text-surface-900 dark:text-white placeholder-surface-400 dark:placeholder-surface-500 focus:outline-none focus:ring-2 focus:ring-primary-500 transition-all duration-200',
                            'autocomplete': 'new-password',
                          }),
                        ],
                      ),
                      // Confirm password field
                      div(
                        {'class': 'flex flex-col gap-2'},
                        [
                          label(
                            {
                              'for': 'signup-confirm-password',
                              'class':
                                  'text-sm font-semibold text-surface-700 dark:text-surface-300',
                            },
                            [Text('Confirm password')],
                          ),
                          input({
                            'type': 'password',
                            'id': 'signup-confirm-password',
                            'name': 'confirmPassword',
                            'placeholder': 'Confirm your password',
                            'class':
                                'w-full px-4 py-3 rounded-xl border border-surface-200 dark:border-surface-700 bg-surface-50 dark:bg-surface-800 text-surface-900 dark:text-white placeholder-surface-400 dark:placeholder-surface-500 focus:outline-none focus:ring-2 focus:ring-primary-500 transition-all duration-200',
                            'autocomplete': 'new-password',
                          }),
                        ],
                      ),
                      // Error and success message containers
                      div({'id': 'signup-error', 'class': 'hidden'}, []),
                      div({'id': 'signup-success', 'class': 'hidden'}, []),
                      // Create account button
                      button(
                        {'id': 'signup-btn', 'class': 'btn-primary w-full'},
                        [Text('Create account')],
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
                      // Sign in link
                      p(
                        {
                          'class':
                              'text-center text-sm text-surface-500 dark:text-surface-400',
                        },
                        [
                          Text('Already have an account? '),
                          a(
                            {
                              'href': '#',
                              'id': 'go-to-login',
                              'class':
                                  'text-primary-600 dark:text-primary-400 font-semibold no-underline hover:underline transition-all duration-200',
                            },
                            [Text('Sign in')],
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
