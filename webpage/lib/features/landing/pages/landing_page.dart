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
                  'href': '#activity-stream',
                  'id': 'nav-activity-link',
                  'class': 'text-sm font-medium text-surface-600 dark:text-surface-300 hover:text-indigo-600 dark:hover:text-indigo-400',
                },
                [Text('⚡ Live Timeline')],
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

          // Right side — auth actions, notifications & dark mode
          div(
            {'class': 'flex items-center gap-3'},
            [
              // Notifications Bell Button
              button(
                {
                  'id': 'notifications-bell-btn',
                  'class': 'p-2 rounded-lg text-surface-500 hover:text-surface-900 dark:hover:text-white hover:bg-surface-100 dark:hover:bg-surface-800 transition-colors relative cursor-pointer',
                  'type': 'button',
                  'title': 'Notifications',
                },
                [
                  span({'class': 'text-lg'}, [Text('🔔')]),
                  span(
                    {
                      'id': 'notif-badge-count',
                      'class': 'absolute -top-1 -right-1 bg-rose-600 text-white text-[10px] font-extrabold w-4 h-4 rounded-full flex items-center justify-center hidden',
                    },
                    [Text('0')],
                  ),
                ],
              ),

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
              button(
                {
                  'id': 'open-sos-modal-btn',
                  'class': 'inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-rose-600 text-white text-xs font-extrabold mb-4 border border-rose-500 shadow-md shadow-rose-600/30 hover:bg-rose-700 transition-all cursor-pointer animate-pulse',
                },
                [
                  span({'class': 'text-sm'}, [Text('⚡')]),
                  Text('DISPATCH EMERGENCY SOS FAVOR'),
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
                  'class': 'text-base md:text-lg text-surface-600 dark:text-surface-300 max-w-2xl mb-6 leading-relaxed',
                },
                [
                  Text(
                    'Borrow tools, request quick errands, pet sitting, or tech support from trusted neighbors and students near you in seconds.',
                  ),
                ],
              ),
              div(
                {
                  'class':
                      'flex flex-wrap items-center justify-center gap-3 mb-8',
                },
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

              // Live Community Stats Banner
              div(
                {
                  'id': 'community-stats-bar',
                  'class': 'grid grid-cols-2 sm:grid-cols-4 gap-4 p-4 rounded-2xl bg-white/80 dark:bg-surface-900/80 border border-surface-200 dark:border-surface-800 backdrop-blur w-full max-w-3xl shadow-sm',
                },
                [
                  div([
                    span(
                      {
                        'id': 'stat-open-count',
                        'class': 'block text-lg font-black text-emerald-600 dark:text-emerald-400',
                      },
                      [Text('0')],
                    ),
                    span(
                      {
                        'class': 'text-[11px] text-surface-500 font-semibold uppercase',
                      },
                      [Text('Open Favors')],
                    ),
                  ]),
                  div([
                    span(
                      {
                        'id': 'stat-progress-count',
                        'class': 'block text-lg font-black text-amber-500',
                      },
                      [Text('0')],
                    ),
                    span(
                      {
                        'class': 'text-[11px] text-surface-500 font-semibold uppercase',
                      },
                      [Text('In Progress')],
                    ),
                  ]),
                  div([
                    span(
                      {
                        'id': 'stat-completed-count',
                        'class': 'block text-lg font-black text-indigo-600 dark:text-indigo-400',
                      },
                      [Text('0')],
                    ),
                    span(
                      {
                        'class': 'text-[11px] text-surface-500 font-semibold uppercase',
                      },
                      [Text('Completed')],
                    ),
                  ]),
                  div([
                    span(
                      {
                        'id': 'stat-points-count',
                        'class': 'block text-lg font-black text-amber-500',
                      },
                      [Text('0')],
                    ),
                    span(
                      {
                        'class': 'text-[11px] text-surface-500 font-semibold uppercase',
                      },
                      [Text('Pts Exchanged')],
                    ),
                  ]),
                ],
              ),
            ],
          ),
        ],
      ),

      // Community Announcements Banner
      div(
        {'class': 'max-w-6xl mx-auto px-4 mt-6'},
        [
          div(
            {
              'id': 'announcements-container',
              'class': 'p-4 rounded-2xl bg-indigo-50 dark:bg-indigo-950/40 border border-indigo-200/60 dark:border-indigo-800/60 flex items-start gap-3',
            },
            [
              span({'class': 'text-2xl'}, [Text('📢')]),
              div(
                {'class': 'flex-1'},
                [
                  h4(
                    {
                      'class': 'text-sm font-bold text-indigo-900 dark:text-indigo-200',
                    },
                    [Text('Community Announcement')],
                  ),
                  p(
                    {
                      'class':
                          'text-xs text-indigo-700 dark:text-indigo-300 mt-0.5',
                    },
                    [
                      Text(
                        'Welcome to HelpHub Community Network! Connect with neighbors and fellow students to exchange favors and lents.',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      // Profile Bar & Stats Card
      div(
        {'class': 'max-w-6xl mx-auto px-4 mt-6'},
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
                      'class': 'w-12 h-12 rounded-full bg-indigo-100 dark:bg-indigo-900/50 text-indigo-600 dark:text-indigo-400 flex items-center justify-center text-xl font-bold relative group',
                    },
                    [
                      span({'id': 'profile-avatar-char'}, [Text('👤')]),
                    ],
                  ),
                  div([
                    div(
                      {'class': 'flex items-center gap-2'},
                      [
                        h3(
                          {
                            'id': 'profile-name',
                            'class': 'text-base font-bold text-surface-900 dark:text-white',
                          },
                          [Text('Guest User')],
                        ),
                        span(
                          {
                            'id': 'profile-rating-badge',
                            'class': 'text-xs font-bold text-amber-500 bg-amber-50 dark:bg-amber-950/50 px-2 py-0.5 rounded-md border border-amber-200 dark:border-amber-800',
                          },
                          [Text('⭐ 5.0')],
                        ),
                        button(
                          {
                            'id': 'open-edit-profile-btn',
                            'class': 'text-[11px] font-semibold text-indigo-600 hover:underline border border-indigo-200 dark:border-indigo-800 px-2 py-0.5 rounded-md bg-indigo-50 dark:bg-indigo-950/50',
                          },
                          [Text('✏️ Edit')],
                        ),
                      ],
                    ),
                    p(
                      {
                        'id': 'profile-badge',
                        'class': 'text-xs text-indigo-600 dark:text-indigo-400 font-medium',
                      },
                      [Text('🌱 Community Rookie')],
                    ),
                    div(
                      {
                        'id': 'profile-skills-tags',
                        'class': 'flex flex-wrap gap-1 mt-1',
                      },
                      [
                        span(
                          {
                            'class': 'text-[10px] px-1.5 py-0.5 bg-surface-100 dark:bg-surface-800 rounded font-medium text-surface-600 dark:text-surface-300',
                          },
                          [Text('🛠️ General')],
                        ),
                      ],
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

      // Leaderboard & Live Activity Stream Section
      div(
        {
          'id': 'leaderboard',
          'class': 'max-w-6xl mx-auto px-4 mt-10 grid grid-cols-1 lg:grid-cols-3 gap-6',
        },
        [
          div(
            {
              'class': 'lg:col-span-2 bg-gradient-to-r from-indigo-900/10 via-purple-900/10 to-transparent p-6 rounded-2xl border border-indigo-200/50 dark:border-indigo-800/50',
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
              div({
                'id': 'leaderboard-container',
                'class': 'grid grid-cols-1 sm:grid-cols-2 gap-3',
              }, []),
            ],
          ),

          // Live Activity Stream
          div(
            {
              'id': 'activity-stream',
              'class': 'p-5 rounded-2xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 shadow-sm flex flex-col justify-between',
            },
            [
              h3(
                {
                  'class': 'text-base font-bold text-surface-900 dark:text-white mb-3 flex items-center gap-2',
                },
                [
                  span({'class': 'text-lg'}, [Text('⚡')]),
                  Text('Live Community Timeline'),
                ],
              ),
              div({
                'id': 'activity-stream-container',
                'class': 'space-y-2.5 max-h-48 overflow-y-auto text-xs',
              }, []),
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
              'class': 'flex flex-col md:flex-row md:items-center justify-between gap-4 mb-3',
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

              // Activity Mode Tabs (All, My Posted, My Claimed, Saved)
              div(
                {
                  'id': 'activity-mode-tabs',
                  'class': 'inline-flex p-1 bg-surface-200/60 dark:bg-surface-800/60 rounded-xl gap-1 text-xs font-semibold',
                },
                [
                  button(
                    {
                      'id': 'tab-all',
                      'class': 'px-3 py-1.5 rounded-lg bg-indigo-600 text-white transition-all cursor-pointer',
                      'data-mode': 'all',
                    },
                    [Text('🌐 All Favors')],
                  ),
                  button(
                    {
                      'id': 'tab-posted',
                      'class': 'px-3 py-1.5 rounded-lg text-surface-600 dark:text-surface-300 hover:text-indigo-600 transition-all cursor-pointer',
                      'data-mode': 'posted',
                    },
                    [Text('📝 My Posted')],
                  ),
                  button(
                    {
                      'id': 'tab-claimed',
                      'class': 'px-3 py-1.5 rounded-lg text-surface-600 dark:text-surface-300 hover:text-indigo-600 transition-all cursor-pointer',
                      'data-mode': 'claimed',
                    },
                    [Text('🤝 My Claimed')],
                  ),
                  button(
                    {
                      'id': 'tab-saved',
                      'class': 'px-3 py-1.5 rounded-lg text-surface-600 dark:text-surface-300 hover:text-indigo-600 transition-all cursor-pointer',
                      'data-mode': 'saved',
                    },
                    [Text('🔖 Saved')],
                  ),
                ],
              ),
            ],
          ),

          // Quick Popular Search Tags
          div(
            {'class': 'flex flex-wrap items-center justify-between gap-2 mb-4'},
            [
              div(
                {'class': 'flex flex-wrap items-center gap-2'},
                [
                  span(
                    {'class': 'text-xs font-bold text-surface-500 mr-1'},
                    [Text('Popular:')],
                  ),
                  button(
                    {
                      'class': 'tag-chip px-2.5 py-1 text-xs font-medium rounded-full bg-surface-100 dark:bg-surface-800 hover:bg-indigo-50 hover:text-indigo-600 border border-surface-200 dark:border-surface-700 transition-colors cursor-pointer',
                      'data-tag': 'ladder',
                    },
                    [Text('🛠️ #Tools')],
                  ),
                  button(
                    {
                      'class': 'tag-chip px-2.5 py-1 text-xs font-medium rounded-full bg-surface-100 dark:bg-surface-800 hover:bg-indigo-50 hover:text-indigo-600 border border-surface-200 dark:border-surface-700 transition-colors cursor-pointer',
                      'data-tag': 'grocery',
                    },
                    [Text('🛵 #Grocery')],
                  ),
                  button(
                    {
                      'class': 'tag-chip px-2.5 py-1 text-xs font-medium rounded-full bg-surface-100 dark:bg-surface-800 hover:bg-indigo-50 hover:text-indigo-600 border border-surface-200 dark:border-surface-700 transition-colors cursor-pointer',
                      'data-tag': 'math',
                    },
                    [Text('📚 #Study')],
                  ),
                  button(
                    {
                      'class': 'tag-chip px-2.5 py-1 text-xs font-medium rounded-full bg-surface-100 dark:bg-surface-800 hover:bg-indigo-50 hover:text-indigo-600 border border-surface-200 dark:border-surface-700 transition-colors cursor-pointer',
                      'data-tag': 'cat',
                    },
                    [Text('🐱 #PetCare')],
                  ),
                ],
              ),

              button(
                {
                  'id': 'reset-filters-btn',
                  'class': 'px-3 py-1 text-xs font-semibold text-rose-600 hover:underline cursor-pointer border border-rose-200 dark:border-rose-900 rounded-lg bg-rose-50/50 dark:bg-rose-950/30',
                },
                [Text('🔄 Reset Filters')],
              ),
            ],
          ),

          div(
            {'class': 'flex flex-wrap items-center gap-3 mb-6'},
            [
              // Emergency Mode Toggle Button
              button(
                {
                  'id': 'toggle-emergency-btn',
                  'type': 'button',
                  'class': 'px-3 py-2 text-xs font-bold rounded-xl border border-rose-300 dark:border-rose-800 bg-rose-50 dark:bg-rose-950/40 text-rose-700 dark:text-rose-300 flex items-center gap-1.5 transition-all cursor-pointer',
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
                'class': 'px-3.5 py-2 text-sm rounded-xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 focus:outline-none focus:border-indigo-500 w-40 md:w-48',
              }),

              // Neighborhood Zone Dropdown
              select(
                {
                  'id': 'zone-filter',
                  'class': 'px-3 py-2 text-sm rounded-xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 text-surface-800 dark:text-surface-200 focus:outline-none focus:border-indigo-500',
                },
                [
                  option({'value': 'All'}, [Text('📍 All Zones')]),
                  option({'value': 'North Campus'}, [Text('North Campus')]),
                  option({'value': 'South Quad'}, [Text('South Quad')]),
                  option({'value': 'West Village'}, [Text('West Village')]),
                  option({'value': 'Downtown East'}, [Text('Downtown East')]),
                ],
              ),

              // Category Filter Dropdown
              select(
                {
                  'id': 'category-filter',
                  'class': 'px-3 py-2 text-sm rounded-xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 text-surface-800 dark:text-surface-200 focus:outline-none focus:border-indigo-500',
                },
                [
                  option({'value': 'All'}, [Text('All Categories')]),
                  option({'value': 'Borrow Item'}, [Text('🛠️ Borrow Item')]),
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
                  option({'value': 'Tech & Rides'}, [Text('💻 Tech & Rides')]),
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
                  option({'value': 'In Progress'}, [Text('🟡 In Progress')]),
                  option({'value': 'Completed'}, [Text('🔵 Completed')]),
                ],
              ),

              // Sort Selector Dropdown
              select(
                {
                  'id': 'sort-filter',
                  'class': 'px-3 py-2 text-sm rounded-xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 text-surface-800 dark:text-surface-200 focus:outline-none focus:border-indigo-500',
                },
                [
                  option({'value': 'newest'}, [Text('🕒 Newest First')]),
                  option({'value': 'reward'}, [Text('🪙 Highest Reward')]),
                  option({'value': 'upvotes'}, [Text('👍 Most Upvotes')]),
                  option({'value': 'urgency'}, [Text('⚡ Most Urgent')]),
                ],
              ),
            ],
          ),

          // Requests Grid Container
          div({
            'id': 'requests-container',
            'class': 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5',
          }, []),
        ],
      ),

      // Modal Dialog for Creating Help Request
      _createRequestModal(),

      // Modal Dialog for Comments
      _commentsModal(),

      // Modal Dialog for Notifications
      _notificationsModal(),

      // Modal Dialog for Rating
      _ratingModal(),

      // Modal Dialog for Profile Edit
      _editProfileModal(),

      // Modal Dialog for Emergency SOS
      _sosModal(),

      // Modal Dialog for Direct Chat
      _chatModal(),

      // Modal Dialog for Completion Proof
      _proofModal(),
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
                      [Text('Neighborhood Zone')],
                    ),
                    select(
                      {
                        'id': 'req-zone',
                        'class': 'w-full px-3 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-indigo-500',
                      },
                      [
                        option(
                          {'value': 'North Campus'},
                          [Text('North Campus')],
                        ),
                        option({'value': 'South Quad'}, [Text('South Quad')]),
                        option(
                          {'value': 'West Village'},
                          [Text('West Village')],
                        ),
                        option(
                          {'value': 'Downtown East'},
                          [Text('Downtown East')],
                        ),
                      ],
                    ),
                  ]),

                  div([
                    label(
                      {
                        'class': 'block text-xs font-semibold text-surface-700 dark:text-surface-300 mb-1',
                      },
                      [Text('Est. Duration')],
                    ),
                    select(
                      {
                        'id': 'req-duration',
                        'class': 'w-full px-3 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-indigo-500',
                      },
                      [
                        option({'value': '15-30 mins'}, [Text('15-30 mins')]),
                        option({'value': '1 hour'}, [Text('1 hour')]),
                        option({'value': '2+ hours'}, [Text('2+ hours')]),
                        option({'value': 'Half day'}, [Text('Half day')]),
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
                      [Text('Location Detail')],
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

          div({
            'id': 'comments-list-container',
            'class': 'flex-1 overflow-y-auto my-3 space-y-3 min-h-[160px] max-h-[300px] border-y border-surface-100 dark:border-surface-800 py-3',
          }, []),

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

Component _chatModal() {
  return div(
    {
      'id': 'chat-modal',
      'class': 'fixed inset-0 z-50 bg-black/60 backdrop-blur-sm flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border border-indigo-300 dark:border-indigo-800 rounded-2xl max-w-lg w-full p-6 shadow-2xl relative flex flex-col max-h-[85vh]',
        },
        [
          button(
            {
              'id': 'close-chat-modal-btn',
              'class': 'absolute top-4 right-4 text-surface-400 hover:text-surface-700 dark:hover:text-white text-xl font-bold',
            },
            [Text('✕')],
          ),
          h2(
            {
              'class': 'text-xl font-bold text-surface-900 dark:text-white mb-1 flex items-center gap-2',
            },
            [
              span({'class': 'text-xl'}, [Text('💬')]),
              Text('Direct Favor Chat'),
            ],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-4'},
            [
              Text(
                'Private real-time coordinate chat between requester and helper.',
              ),
            ],
          ),

          div({
            'id': 'chat-messages-container',
            'class': 'flex-1 overflow-y-auto my-3 space-y-3 min-h-[180px] max-h-[300px] border-y border-surface-100 dark:border-surface-800 py-3',
          }, []),

          div(
            {'class': 'mt-3 flex gap-2'},
            [
              input({
                'id': 'chat-input',
                'type': 'text',
                'placeholder': 'Type a direct message...',
                'class': 'flex-1 px-3.5 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-indigo-500',
              }),
              button(
                {
                  'id': 'submit-chat-btn',
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

Component _proofModal() {
  return div(
    {
      'id': 'proof-modal',
      'class': 'fixed inset-0 z-50 bg-black/60 backdrop-blur-sm flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border border-emerald-300 dark:border-emerald-800 rounded-2xl max-w-sm w-full p-6 shadow-2xl relative text-center',
        },
        [
          button(
            {
              'id': 'close-proof-modal-btn',
              'class': 'absolute top-4 right-4 text-surface-400 hover:text-surface-700 dark:hover:text-white text-xl font-bold',
            },
            [Text('✕')],
          ),
          div({'class': 'text-4xl mb-2'}, [Text('🎉')]),
          h2(
            {
              'class':
                  'text-lg font-bold text-surface-900 dark:text-white mb-1',
            },
            [Text('Complete Favor with Proof Note')],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-4'},
            [
              Text(
                'Add an optional completion note or receipt detail for the requester.',
              ),
            ],
          ),

          textarea({
            'id': 'proof-note-input',
            'rows': '3',
            'placeholder':
                'e.g., Returned item to Dorm A desk / Picked up groceries!',
            'class': 'w-full px-3.5 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-emerald-500 mb-4',
          }, []),

          button(
            {
              'id': 'submit-proof-btn',
              'type': 'button',
              'class': 'w-full py-2.5 text-sm font-bold text-white bg-emerald-600 hover:bg-emerald-700 rounded-xl transition-all shadow-md',
            },
            [Text('Confirm Favor Completion')],
          ),
        ],
      ),
    ],
  );
}

Component _notificationsModal() {
  return div(
    {
      'id': 'notifications-modal',
      'class': 'fixed inset-0 z-50 bg-black/60 backdrop-blur-sm flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 rounded-2xl max-w-md w-full p-6 shadow-2xl relative flex flex-col max-h-[80vh]',
        },
        [
          button(
            {
              'id': 'close-notif-modal-btn',
              'class': 'absolute top-4 right-4 text-surface-400 hover:text-surface-700 dark:hover:text-white text-xl font-bold',
            },
            [Text('✕')],
          ),
          h2(
            {
              'class': 'text-xl font-bold text-surface-900 dark:text-white mb-1 flex items-center gap-2',
            },
            [
              span({'class': 'text-xl'}, [Text('🔔')]),
              Text('Notifications Feed'),
            ],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-4'},
            [Text('Updates regarding your posted and claimed favor requests.')],
          ),

          div({
            'id': 'notifications-list-container',
            'class': 'flex-1 overflow-y-auto my-2 space-y-2.5 min-h-[180px] max-h-[350px] border-y border-surface-100 dark:border-surface-800 py-3',
          }, []),
        ],
      ),
    ],
  );
}

Component _ratingModal() {
  return div(
    {
      'id': 'rating-modal',
      'class': 'fixed inset-0 z-50 bg-black/60 backdrop-blur-sm flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 rounded-2xl max-w-sm w-full p-6 shadow-2xl relative text-center',
        },
        [
          button(
            {
              'id': 'close-rating-modal-btn',
              'class': 'absolute top-4 right-4 text-surface-400 hover:text-surface-700 dark:hover:text-white text-xl font-bold',
            },
            [Text('✕')],
          ),
          div({'class': 'text-4xl mb-2'}, [Text('⭐')]),
          h2(
            {
              'class':
                  'text-lg font-bold text-surface-900 dark:text-white mb-1',
            },
            [Text('Rate Helper Performance')],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-4'},
            [
              Text(
                'Your feedback helps maintain trust in the HelpHub network.',
              ),
            ],
          ),

          select(
            {
              'id': 'rating-score-select',
              'class': 'w-full px-3 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-indigo-500 mb-3',
            },
            [
              option({'value': '5'}, [Text('⭐⭐⭐⭐⭐ (5/5) Excellent')]),
              option({'value': '4'}, [Text('⭐⭐⭐⭐ (4/5) Very Good')]),
              option({'value': '3'}, [Text('⭐⭐⭐ (3/5) Average')]),
              option({'value': '2'}, [Text('⭐⭐ (2/5) Below Average')]),
              option({'value': '1'}, [Text('⭐ (1/5) Poor')]),
            ],
          ),

          textarea({
            'id': 'rating-feedback-input',
            'rows': '2',
            'placeholder': 'Optional review feedback...',
            'class': 'w-full px-3.5 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-indigo-500 mb-4',
          }, []),

          button(
            {
              'id': 'submit-rating-btn',
              'type': 'button',
              'class': 'w-full py-2.5 text-sm font-bold text-white bg-indigo-600 hover:bg-indigo-700 rounded-xl transition-all shadow-md',
            },
            [Text('Submit Rating')],
          ),
        ],
      ),
    ],
  );
}

Component _editProfileModal() {
  return div(
    {
      'id': 'edit-profile-modal',
      'class': 'fixed inset-0 z-50 bg-black/60 backdrop-blur-sm flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 rounded-2xl max-w-sm w-full p-6 shadow-2xl relative',
        },
        [
          button(
            {
              'id': 'close-edit-profile-modal-btn',
              'class': 'absolute top-4 right-4 text-surface-400 hover:text-surface-700 dark:hover:text-white text-xl font-bold',
            },
            [Text('✕')],
          ),
          h2(
            {
              'class':
                  'text-lg font-bold text-surface-900 dark:text-white mb-1',
            },
            [Text('Edit Profile & Skills')],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-4'},
            [Text('Customize how fellow neighbors see you on HelpHub.')],
          ),

          div(
            {'class': 'flex flex-col gap-3'},
            [
              div([
                label(
                  {
                    'class': 'block text-xs font-semibold text-surface-700 dark:text-surface-300 mb-1',
                  },
                  [Text('Display Name')],
                ),
                input({
                  'id': 'edit-profile-name-input',
                  'type': 'text',
                  'placeholder': 'e.g., Alex Rivers',
                  'class': 'w-full px-3.5 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-indigo-500',
                }),
              ]),

              div([
                label(
                  {
                    'class': 'block text-xs font-semibold text-surface-700 dark:text-surface-300 mb-1',
                  },
                  [Text('Skills & Specialties (comma separated)')],
                ),
                input({
                  'id': 'edit-profile-skills-input',
                  'type': 'text',
                  'placeholder': 'e.g., Errands, Tutoring, Tech, Bike Repair',
                  'class': 'w-full px-3.5 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-indigo-500',
                }),
              ]),

              button(
                {
                  'id': 'submit-edit-profile-btn',
                  'type': 'button',
                  'class': 'w-full mt-2 py-2.5 text-sm font-bold text-white bg-indigo-600 hover:bg-indigo-700 rounded-xl transition-all shadow-md',
                },
                [Text('Save Changes')],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Component _sosModal() {
  return div(
    {
      'id': 'sos-modal',
      'class': 'fixed inset-0 z-50 bg-black/70 backdrop-blur-md flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border-2 border-rose-500 rounded-2xl max-w-md w-full p-6 shadow-2xl relative',
        },
        [
          button(
            {
              'id': 'close-sos-modal-btn',
              'class': 'absolute top-4 right-4 text-surface-400 hover:text-surface-700 dark:hover:text-white text-xl font-bold',
            },
            [Text('✕')],
          ),
          div(
            {
              'class': 'flex items-center gap-2 mb-2 text-rose-600 dark:text-rose-400 font-extrabold text-lg',
            },
            [
              span({'class': 'text-2xl animate-ping'}, [Text('🚨')]),
              Text('Broadcast Emergency SOS'),
            ],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-4'},
            [
              Text(
                'Immediately notifies available top helpers nearby for urgent situations.',
              ),
            ],
          ),

          div(
            {'class': 'flex flex-col gap-3'},
            [
              div([
                label(
                  {
                    'class': 'block text-xs font-semibold text-surface-700 dark:text-surface-300 mb-1',
                  },
                  [Text('Emergency Summary')],
                ),
                input({
                  'id': 'sos-title',
                  'type': 'text',
                  'placeholder': 'e.g., Dead car battery at East Lot',
                  'class': 'w-full px-3.5 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-rose-300 dark:border-rose-800 focus:outline-none focus:border-rose-500',
                }),
              ]),

              div([
                label(
                  {
                    'class': 'block text-xs font-semibold text-surface-700 dark:text-surface-300 mb-1',
                  },
                  [Text('Exact Location')],
                ),
                input({
                  'id': 'sos-location',
                  'type': 'text',
                  'placeholder': 'e.g., Parking Lot C, Slot 42',
                  'class': 'w-full px-3.5 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-rose-500',
                }),
              ]),

              div([
                label(
                  {
                    'class': 'block text-xs font-semibold text-surface-700 dark:text-surface-300 mb-1',
                  },
                  [Text('Urgent Details')],
                ),
                textarea({
                  'id': 'sos-desc',
                  'rows': '2',
                  'placeholder': 'Describe immediate help needed...',
                  'class': 'w-full px-3.5 py-2 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-rose-500',
                }, []),
              ]),

              button(
                {
                  'id': 'submit-sos-btn',
                  'type': 'button',
                  'class': 'w-full mt-2 py-3 text-sm font-extrabold text-white bg-rose-600 hover:bg-rose-700 rounded-xl transition-all shadow-lg shadow-rose-600/30 flex items-center justify-center gap-2 cursor-pointer',
                },
                [
                  span({'class': 'text-base'}, [Text('⚡')]),
                  Text('BROADCAST EMERGENCY SOS NOW'),
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
