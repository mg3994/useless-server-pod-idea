import 'package:blogger_theme/blogger_theme.dart';

/// Renders the top navigation bar with HelpHub branding and navigation links.
Component navbar() {
  return header(
    {
      'class': 'navbar sticky top-0 z-40 bg-surface-50/90 dark:bg-surface-900/90 backdrop-blur border-b border-surface-200 dark:border-surface-800 px-4 py-3',
    },
    [
      div(
        {'class': 'max-w-7xl mx-auto flex items-center justify-between'},
        [
          // Brand Logo
          a(
            {
              'href': '#',
              'id': 'nav-logo',
              'class': 'flex items-center gap-2.5 no-underline',
            },
            [
              div(
                {
                  'class': 'w-10 h-10 rounded-xl bg-gradient-to-tr from-indigo-600 to-violet-500 flex items-center justify-center text-white shadow-md shadow-indigo-500/20',
                },
                [
                  span({'class': 'text-xl font-black'}, [Text('H')]),
                ],
              ),
              div(
                {'class': 'flex flex-col'},
                [
                  span(
                    {
                      'class': 'text-lg font-bold text-surface-900 dark:text-white leading-none tracking-tight',
                    },
                    [Text('HelpHub')],
                  ),
                  span(
                    {
                      'class': 'text-xs text-indigo-600 dark:text-indigo-400 font-medium tracking-wide',
                    },
                    [Text('Campus & Local Network')],
                  ),
                ],
              ),
            ],
          ),

          // Center Links
          nav(
            {'class': 'hidden md:flex items-center gap-6'},
            [
              a(
                {
                  'href': '#feed',
                  'id': 'nav-feed',
                  'class': 'text-sm font-semibold text-indigo-600 dark:text-indigo-400 hover:text-indigo-700',
                },
                [Text('Live Request Feed')],
              ),
              a(
                {
                  'href': '#leaderboard',
                  'id': 'nav-leaderboard-link',
                  'class': 'text-sm font-medium text-surface-600 dark:text-surface-300 hover:text-indigo-600 dark:hover:text-indigo-400',
                },
                [Text('🏆 Leaderboard')],
              ),
              a(
                {
                  'href': '#create',
                  'id': 'nav-create-shortcut',
                  'class': 'text-sm font-medium text-surface-600 dark:text-surface-300 hover:text-indigo-600 dark:hover:text-indigo-400',
                },
                [Text('Post Favor Request')],
              ),
            ],
          ),

          // Right side — auth actions & dark mode
          div(
            {'class': 'flex items-center gap-3'},
            [
              button(
                {
                  'id': 'dark-mode-toggle',
                  'class': 'p-2 rounded-lg text-surface-500 hover:text-surface-900 dark:hover:text-white hover:bg-surface-100 dark:hover:bg-surface-800 transition-colors',
                  'type': 'button',
                  'title': 'Toggle dark mode',
                },
                [
                  span({'class': 'i-carbon-moon text-xl'}, []),
                ],
              ),
              div(
                {
                  'id': 'auth-actions-logged-out',
                  'class': 'flex items-center gap-2',
                },
                [
                  a(
                    {
                      'href': '#',
                      'id': 'nav-login',
                      'class': 'px-3 py-1.5 text-sm font-medium text-surface-700 dark:text-surface-200 hover:text-indigo-600 dark:hover:text-indigo-400',
                    },
                    [Text('Log in')],
                  ),
                  a(
                    {
                      'href': '#',
                      'id': 'nav-signup',
                      'class': 'px-4 py-1.5 text-sm font-semibold text-white bg-indigo-600 hover:bg-indigo-700 rounded-lg shadow-sm transition-all',
                    },
                    [Text('Sign up')],
                  ),
                ],
              ),
              div(
                {
                  'id': 'auth-actions-logged-in',
                  'class': 'hidden flex items-center gap-3',
                },
                [
                  div(
                    {
                      'class': 'flex items-center gap-2 bg-indigo-50 dark:bg-indigo-950/50 px-3 py-1 rounded-full border border-indigo-200 dark:border-indigo-800',
                    },
                    [
                      span({
                        'class':
                            'w-2 h-2 rounded-full bg-emerald-500 animate-pulse',
                      }, []),
                      span({
                        'id': 'user-email',
                        'class': 'text-xs text-indigo-900 dark:text-indigo-200 font-semibold',
                      }, []),
                    ],
                  ),
                  button(
                    {
                      'id': 'nav-signout',
                      'class': 'px-3 py-1.5 text-xs font-medium text-surface-500 hover:text-red-600 dark:text-surface-400',
                    },
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

/// Renders the main Hero and Feed UI for HelpHub.
Component landingHero() {
  return div(
    {
      'id': 'home-page',
      'class': 'min-h-screen bg-surface-50 dark:bg-surface-950 text-surface-900 dark:text-surface-100 pb-16',
    },
    [
      // Hero Header Banner
      div(
        {
          'class': 'bg-gradient-to-b from-indigo-900/10 to-transparent py-12 px-4 border-b border-surface-200/50 dark:border-surface-800/50',
        },
        [
          div(
            {
              'class':
                  'max-w-5xl mx-auto text-center flex flex-col items-center',
            },
            [
              div(
                {
                  'class': 'inline-flex items-center gap-2 px-3 py-1 rounded-full bg-rose-100 dark:bg-rose-950/60 text-rose-700 dark:text-rose-300 text-xs font-semibold mb-4 border border-rose-200 dark:border-rose-800',
                },
                [
                  span({
                    'class': 'w-2 h-2 rounded-full bg-rose-500 animate-ping',
                  }, []),
                  Text('🚨 Emergency SOS Favor Dispatch Active'),
                ],
              ),
              h1(
                {
                  'class': 'text-4xl md:text-5xl font-black text-surface-900 dark:text-white tracking-tight mb-4',
                },
                [
                  Text('Need a quick favor? '),
                  span(
                    {
                      'class': 'text-transparent bg-clip-text bg-gradient-to-r from-indigo-600 to-violet-500',
                    },
                    [Text('HelpHub')],
                  ),
                  Text(' has your back.'),
                ],
              ),
              p(
                {
                  'class': 'text-base md:text-lg text-surface-600 dark:text-surface-300 max-w-2xl mb-8 leading-relaxed',
                },
                [
                  Text(
                    'Borrow tools, request quick errands, pet sitting, or tech support from trusted neighbors and students near you in seconds.',
                  ),
                ],
              ),
              div(
                {'class': 'flex flex-wrap items-center justify-center gap-3'},
                [
                  button(
                    {
                      'id': 'open-create-modal-btn',
                      'class': 'px-6 py-3 text-sm font-bold text-white bg-indigo-600 hover:bg-indigo-700 rounded-xl shadow-lg shadow-indigo-500/25 transition-all flex items-center gap-2 cursor-pointer',
                    },
                    [
                      span({'class': 'text-lg'}, [Text('➕')]),
                      Text('Post a Help Request'),
                    ],
                  ),
                  a(
                    {
                      'href': '#feed',
                      'class': 'px-6 py-3 text-sm font-semibold text-surface-700 dark:text-surface-200 bg-surface-200/70 dark:bg-surface-800/70 hover:bg-surface-300 dark:hover:bg-surface-700 rounded-xl transition-all',
                    },
                    [Text('Browse Live Requests')],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      // Profile Bar & Stats Card
      div(
        {'class': 'max-w-6xl mx-auto px-4 mt-8'},
        [
          div(
            {
              'class': 'p-5 rounded-2xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 shadow-sm flex flex-col md:flex-row md:items-center justify-between gap-4',
            },
            [
              div(
                {'class': 'flex items-center gap-3'},
                [
                  div(
                    {
                      'class': 'w-12 h-12 rounded-full bg-indigo-100 dark:bg-indigo-900/50 text-indigo-600 dark:text-indigo-400 flex items-center justify-center text-xl font-bold',
                    },
                    [
                      span({'id': 'profile-avatar-char'}, [Text('👤')]),
                    ],
                  ),
                  div([
                    h3(
                      {
                        'id': 'profile-name',
                        'class': 'text-base font-bold text-surface-900 dark:text-white',
                      },
                      [Text('Guest User')],
                    ),
                    p(
                      {
                        'id': 'profile-badge',
                        'class': 'text-xs text-indigo-600 dark:text-indigo-400 font-medium',
                      },
                      [Text('🌱 Community Rookie')],
                    ),
                  ]),
                ],
              ),

              // Milestone Progress Bar
              div(
                {'class': 'flex-1 max-w-xs'},
                [
                  div(
                    {
                      'class': 'flex justify-between text-[11px] font-semibold text-surface-500 mb-1',
                    },
                    [
                      Text('Next Rank Progress'),
                      span({'id': 'milestone-text'}, [Text('0 / 5 Favors')]),
                    ],
                  ),
                  div(
                    {
                      'class': 'w-full bg-surface-100 dark:bg-surface-800 rounded-full h-2 overflow-hidden',
                    },
                    [
                      div({
                        'id': 'milestone-bar',
                        'class': 'bg-indigo-600 h-2 rounded-full transition-all duration-500',
                        'style': 'width: 20%',
                      }, []),
                    ],
                  ),
                ],
              ),

              div(
                {'class': 'flex items-center gap-6 text-center'},
                [
                  div([
                    span(
                      {
                        'id': 'profile-points',
                        'class': 'block text-xl font-black text-amber-500',
                      },
                      [Text('50')],
                    ),
                    span(
                      {
                        'class': 'text-xs text-surface-500 dark:text-surface-400 uppercase font-semibold',
                      },
                      [Text('Reward Points')],
                    ),
                  ]),
                  div({
                    'class': 'w-px h-8 bg-surface-200 dark:bg-surface-800',
                  }, []),
                  div([
                    span(
                      {
                        'id': 'profile-completed',
                        'class': 'block text-xl font-black text-emerald-500',
                      },
                      [Text('0')],
                    ),
                    span(
                      {
                        'class': 'text-xs text-surface-500 dark:text-surface-400 uppercase font-semibold',
                      },
                      [Text('Favors Done')],
                    ),
                  ]),
                  div({
                    'class': 'w-px h-8 bg-surface-200 dark:bg-surface-800',
                  }, []),
                  div([
                    span(
                      {
                        'id': 'profile-requested',
                        'class': 'block text-xl font-black text-indigo-500',
                      },
                      [Text('0')],
                    ),
                    span(
                      {
                        'class': 'text-xs text-surface-500 dark:text-surface-400 uppercase font-semibold',
                      },
                      [Text('Requested')],
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ],
      ),

      // Leaderboard Section
      div(
        {'id': 'leaderboard', 'class': 'max-w-6xl mx-auto px-4 mt-10'},
        [
          div(
            {
              'class': 'bg-gradient-to-r from-indigo-900/10 via-purple-900/10 to-transparent p-6 rounded-2xl border border-indigo-200/50 dark:border-indigo-800/50',
            },
            [
              div(
                {'class': 'flex items-center justify-between mb-4'},
                [
                  h2(
                    {
                      'class': 'text-xl font-bold text-surface-900 dark:text-white flex items-center gap-2',
                    },
                    [
                      span({'class': 'text-2xl'}, [Text('🏆')]),
                      Text('Top Community Helpers'),
                    ],
                  ),
                  span(
                    {
                      'class': 'text-xs text-indigo-600 dark:text-indigo-400 font-semibold',
                    },
                    [Text('Rankings update live')],
                  ),
                ],
              ),
              div(
                {
                  'id': 'leaderboard-container',
                  'class':
                      'grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-3',
                },
                [
                  div(
                    {
                      'class': 'p-3 rounded-xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 flex items-center gap-3',
                    },
                    [
                      span(
                        {'class': 'text-lg font-black text-amber-500'},
                        [Text('#1')],
                      ),
                      div(
                        {'class': 'flex-1'},
                        [
                          h4(
                            {'class': 'text-sm font-bold'},
                            [Text('Alex Rivers')],
                          ),
                          p(
                            {'class': 'text-xs text-surface-500'},
                            [Text('⚡ Community Hero')],
                          ),
                        ],
                      ),
                      span(
                        {'class': 'text-xs font-bold text-amber-500'},
                        [Text('340 pts')],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      // Filter & Feed Section
      div(
        {'id': 'feed', 'class': 'max-w-6xl mx-auto px-4 mt-8'},
        [
          // Filter Controls
          div(
            {
              'class': 'flex flex-col md:flex-row md:items-center justify-between gap-4 mb-6',
            },
            [
              h2(
                {
                  'class': 'text-2xl font-bold text-surface-900 dark:text-white flex items-center gap-2',
                },
                [
                  span({
                    'class': 'w-3 h-3 rounded-full bg-emerald-500 animate-ping',
                  }, []),
                  Text('Live Requests Feed'),
                ],
              ),

              div(
                {'class': 'flex flex-wrap items-center gap-3'},
                [
                  // Emergency Mode Toggle Button
                  button(
                    {
                      'id': 'toggle-emergency-btn',
                      'type': 'button',
                      'class': 'px-3 py-2 text-xs font-bold rounded-xl border border-rose-300 dark:border-rose-800 bg-rose-50 dark:bg-rose-950/40 text-rose-700 dark:text-rose-300 flex items-center gap-1.5 transition-all',
                    },
                    [
                      span({'class': 'text-sm'}, [Text('🚨')]),
                      span(
                        {'id': 'emergency-toggle-text'},
                        [Text('Emergency Only: OFF')],
                      ),
                    ],
                  ),

                  // Search Bar
                  input({
                    'id': 'search-input',
                    'type': 'text',
                    'placeholder': 'Search requests...',
                    'class': 'px-3.5 py-2 text-sm rounded-xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 focus:outline-none focus:border-indigo-500 w-48 md:w-56',
                  }),

                  // Category Filter Dropdown
                  select(
                    {
                      'id': 'category-filter',
                      'class': 'px-3 py-2 text-sm rounded-xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 text-surface-800 dark:text-surface-200 focus:outline-none focus:border-indigo-500',
                    },
                    [
                      option({'value': 'All'}, [Text('All Categories')]),
                      option(
                        {'value': 'Borrow Item'},
                        [Text('🛠️ Borrow Item')],
                      ),
                      option(
                        {'value': 'Errand & Delivery'},
                        [Text('🛵 Errand & Delivery')],
                      ),
                      option(
                        {'value': 'Tutoring & Study'},
                        [Text('📚 Tutoring & Study')],
                      ),
                      option(
                        {'value': 'Pet & Plant Care'},
                        [Text('🐱 Pet & Plant Care')],
                      ),
                      option(
                        {'value': 'Tech & Rides'},
                        [Text('💻 Tech & Rides')],
                      ),
                    ],
                  ),

                  // Status Filter Dropdown
                  select(
                    {
                      'id': 'status-filter',
                      'class': 'px-3 py-2 text-sm rounded-xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 text-surface-800 dark:text-surface-200 focus:outline-none focus:border-indigo-500',
                    },
                    [
                      option({'value': 'All'}, [Text('All Statuses')]),
                      option({'value': 'Open'}, [Text('🟢 Open')]),
                      option(
                        {'value': 'In Progress'},
                        [Text('🟡 In Progress')],
                      ),
                      option({'value': 'Completed'}, [Text('🔵 Completed')]),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // Requests Grid Container
          div(
            {
              'id': 'requests-container',
              'class': 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5',
            },
            [
              // Default Initial Card Skeleton / Samples
              _sampleCard(
                title: 'Borrow a High-Temp Glue Gun',
                category: '🛠️ Borrow Item',
                location: 'Dorm Block B, Room 304',
                urgency: 'Medium',
                points: 20,
                status: 'Open',
                creator: 'alex@campus.edu',
                description: 'Need a glue gun for 2 hours to fix a design project prototype tonight.',
                id: 1,
              ),
              _sampleCard(
                title: 'Quick Grocery Pickup from Target',
                category: '🛵 Errand & Delivery',
                location: 'North Campus Quad',
                urgency: 'Urgent',
                points: 40,
                status: 'Open',
                creator: 'maria@campus.edu',
                description: 'Super sick and need someone to pick up milk and cough medicine.',
                id: 2,
              ),
              _sampleCard(
                title: 'Cal 2 Integration Homework Help',
                category: '📚 Tutoring & Study',
                location: 'Library 2nd Floor',
                urgency: 'Low',
                points: 35,
                status: 'In Progress',
                creator: 'david@campus.edu',
                description: 'Stuck on partial fractions problem set. 30 mins explanation needed!',
                id: 3,
              ),
            ],
          ),
        ],
      ),

      // Modal Dialog for Creating Help Request
      _createRequestModal(),

      // Modal Dialog for Comments
      _commentsModal(),
    ],
  );
}

Component _sampleCard({
  required String title,
  required String category,
  required String location,
  required String urgency,
  required int points,
  required String status,
  required String creator,
  required String description,
  required int id,
}) {
  String urgencyBg =
      'bg-amber-100 text-amber-800 dark:bg-amber-900/40 dark:text-amber-300';
  if (urgency == 'Urgent') {
    urgencyBg =
        'bg-rose-100 text-rose-800 dark:bg-rose-900/40 dark:text-rose-300';
  } else if (urgency == 'Low') {
    urgencyBg =
        'bg-slate-100 text-slate-800 dark:bg-slate-800 dark:text-slate-300';
  }

  return div(
    {
      'class': 'bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 rounded-2xl p-5 shadow-sm hover:shadow-md transition-all flex flex-col justify-between gap-4',
    },
    [
      div([
        div(
          {'class': 'flex items-center justify-between gap-2 mb-2'},
          [
            span(
              {
                'class': 'text-xs font-semibold px-2.5 py-1 rounded-full bg-indigo-50 dark:bg-indigo-950/60 text-indigo-600 dark:text-indigo-400',
              },
              [Text(category)],
            ),
            span(
              {
                'class':
                    'text-xs font-semibold px-2 py-0.5 rounded-full $urgencyBg',
              },
              [Text(urgency)],
            ),
          ],
        ),
        h3(
          {
            'class': 'text-lg font-bold text-surface-900 dark:text-white mb-1 leading-snug',
          },
          [Text(title)],
        ),
        p(
          {
            'class': 'text-xs text-surface-500 dark:text-surface-400 mb-3 flex items-center gap-1',
          },
          [
            span({'class': 'text-sm'}, [Text('📍')]),
            Text(location),
          ],
        ),
        p(
          {
            'class': 'text-sm text-surface-600 dark:text-surface-300 line-clamp-3 mb-4',
          },
          [Text(description)],
        ),
      ]),
      div(
        {
          'class': 'pt-3 border-t border-surface-100 dark:border-surface-800 flex items-center justify-between',
        },
        [
          div(
            {
              'class':
                  'flex items-center gap-1 text-amber-500 font-bold text-sm',
            },
            [
              span({'class': 'text-base'}, [Text('🪙')]),
              Text('+$points pts'),
            ],
          ),
          button(
            {
              'class': 'claim-btn px-4 py-1.5 text-xs font-semibold rounded-lg text-white bg-indigo-600 hover:bg-indigo-700 transition-colors',
              'data-id': '$id',
            },
            [Text('Claim Request')],
          ),
        ],
      ),
    ],
  );
}

Component _createRequestModal() {
  return div(
    {
      'id': 'create-modal',
      'class': 'fixed inset-0 z-50 bg-black/60 backdrop-blur-sm flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 rounded-2xl max-w-lg w-full p-6 shadow-2xl relative',
        },
        [
          button(
            {
              'id': 'close-create-modal-btn',
              'class': 'absolute top-4 right-4 text-surface-400 hover:text-surface-700 dark:hover:text-white text-xl font-bold',
            },
            [Text('✕')],
          ),
          h2(
            {
              'class':
                  'text-xl font-bold text-surface-900 dark:text-white mb-1',
            },
            [Text('Post a Help Request')],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-5'},
            [
              Text(
                'Describe what you need and offer points for neighbors who assist!',
              ),
            ],
          ),

          div(
            {'class': 'flex flex-col gap-4'},
            [
              div([
                label(
                  {
                    'class': 'block text-xs font-semibold text-surface-700 dark:text-surface-300 mb-1',
                  },
                  [Text('Title')],
                ),
                input({
                  'id': 'req-title',
                  'type': 'text',
                  'placeholder': 'e.g., Need jumper cables for car',
                  'class': 'w-full px-3.5 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-indigo-500',
                }),
              ]),

              div(
                {'class': 'grid grid-cols-2 gap-3'},
                [
                  div([
                    label(
                      {
                        'class': 'block text-xs font-semibold text-surface-700 dark:text-surface-300 mb-1',
                      },
                      [Text('Category')],
                    ),
                    select(
                      {
                        'id': 'req-category',
                        'class': 'w-full px-3 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-indigo-500',
                      },
                      [
                        option(
                          {'value': 'Borrow Item'},
                          [Text('🛠️ Borrow Item')],
                        ),
                        option(
                          {'value': 'Errand & Delivery'},
                          [Text('🛵 Errand & Delivery')],
                        ),
                        option(
                          {'value': 'Tutoring & Study'},
                          [Text('📚 Tutoring & Study')],
                        ),
                        option(
                          {'value': 'Pet & Plant Care'},
                          [Text('🐱 Pet & Plant Care')],
                        ),
                        option(
                          {'value': 'Tech & Rides'},
                          [Text('💻 Tech & Rides')],
                        ),
                      ],
                    ),
                  ]),

                  div([
                    label(
                      {
                        'class': 'block text-xs font-semibold text-surface-700 dark:text-surface-300 mb-1',
                      },
                      [Text('Urgency')],
                    ),
                    select(
                      {
                        'id': 'req-urgency',
                        'class': 'w-full px-3 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-indigo-500',
                      },
                      [
                        option({'value': 'Normal'}, [Text('Normal')]),
                        option({'value': 'Urgent'}, [Text('⚡ Urgent')]),
                        option({'value': 'Low'}, [Text('Low')]),
                      ],
                    ),
                  ]),
                ],
              ),

              div(
                {'class': 'grid grid-cols-2 gap-3'},
                [
                  div([
                    label(
                      {
                        'class': 'block text-xs font-semibold text-surface-700 dark:text-surface-300 mb-1',
                      },
                      [Text('Location')],
                    ),
                    input({
                      'id': 'req-location',
                      'type': 'text',
                      'placeholder': 'e.g., Campus East Quad',
                      'class': 'w-full px-3.5 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-indigo-500',
                    }),
                  ]),

                  div([
                    label(
                      {
                        'class': 'block text-xs font-semibold text-surface-700 dark:text-surface-300 mb-1',
                      },
                      [Text('Reward Points')],
                    ),
                    input({
                      'id': 'req-points',
                      'type': 'number',
                      'value': '25',
                      'class': 'w-full px-3.5 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-indigo-500',
                    }),
                  ]),
                ],
              ),

              div([
                label(
                  {
                    'class': 'block text-xs font-semibold text-surface-700 dark:text-surface-300 mb-1',
                  },
                  [Text('Description')],
                ),
                textarea({
                  'id': 'req-description',
                  'rows': '3',
                  'placeholder':
                      'Provide details about what you need and time frame...',
                  'class': 'w-full px-3.5 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-indigo-500',
                }, []),
              ]),

              div(
                {'class': 'mt-2 flex items-center justify-end gap-3'},
                [
                  button(
                    {
                      'id': 'cancel-create-btn',
                      'type': 'button',
                      'class': 'px-4 py-2 text-sm font-medium text-surface-600 dark:text-surface-300 hover:text-surface-900',
                    },
                    [Text('Cancel')],
                  ),
                  button(
                    {
                      'id': 'submit-create-btn',
                      'type': 'button',
                      'class': 'px-5 py-2 text-sm font-semibold text-white bg-indigo-600 hover:bg-indigo-700 rounded-xl transition-all shadow-md',
                    },
                    [Text('Publish Request')],
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

Component _commentsModal() {
  return div(
    {
      'id': 'comments-modal',
      'class': 'fixed inset-0 z-50 bg-black/60 backdrop-blur-sm flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 rounded-2xl max-w-lg w-full p-6 shadow-2xl relative flex flex-col max-h-[85vh]',
        },
        [
          button(
            {
              'id': 'close-comments-modal-btn',
              'class': 'absolute top-4 right-4 text-surface-400 hover:text-surface-700 dark:hover:text-white text-xl font-bold',
            },
            [Text('✕')],
          ),
          h2(
            {
              'id': 'comments-title',
              'class':
                  'text-xl font-bold text-surface-900 dark:text-white mb-1',
            },
            [Text('Request Discussion')],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-4'},
            [Text('Ask questions or offer specific help details below.')],
          ),

          div(
            {
              'id': 'comments-list-container',
              'class': 'flex-1 overflow-y-auto my-3 space-y-3 min-h-[160px] max-h-[300px] border-y border-surface-100 dark:border-surface-800 py-3',
            },
            [
              p(
                {'class': 'text-xs text-surface-400 text-center py-4'},
                [Text('No comments yet. Start the conversation!')],
              ),
            ],
          ),

          div(
            {'class': 'mt-3 flex gap-2'},
            [
              input({
                'id': 'comment-input',
                'type': 'text',
                'placeholder': 'Write a comment or question...',
                'class': 'flex-1 px-3.5 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-indigo-500',
              }),
              button(
                {
                  'id': 'submit-comment-btn',
                  'type': 'button',
                  'class': 'px-4 py-2 text-sm font-semibold text-white bg-indigo-600 hover:bg-indigo-700 rounded-xl transition-all',
                },
                [Text('Send')],
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
    {
      'class': 'footer border-t border-surface-200 dark:border-surface-800 py-8 bg-surface-100/50 dark:bg-surface-900/50',
    },
    [
      div(
        {'class': 'max-w-6xl mx-auto px-4 text-center'},
        [
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400'},
            [
              Text('© 2026 HelpHub Community Network. Powered by '),
              span(
                {'class': 'font-semibold text-indigo-600 dark:text-indigo-400'},
                [Text('Serverpod')],
              ),
              Text(', '),
              span(
                {'class': 'font-semibold text-indigo-600 dark:text-indigo-400'},
                [Text('Flutter')],
              ),
              Text(' & '),
              span(
                {'class': 'font-semibold text-indigo-600 dark:text-indigo-400'},
                [Text('UnoCSS')],
              ),
              Text('.'),
            ],
          ),
        ],
      ),
    ],
  );
}
