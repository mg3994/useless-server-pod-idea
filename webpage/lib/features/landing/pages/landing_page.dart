import 'package:blogger_theme/blogger_theme.dart';

/// Renders the sleek top navbar with HelpHub branding, quick links, dark mode, and auth actions.
Component navbar() {
  return header(
    {
      'class': 'navbar sticky top-0 z-50 bg-white/90 dark:bg-surface-900/90 backdrop-blur-xl border-b border-surface-200/60 dark:border-surface-800/60 px-6 py-3.5 shadow-sm transition-all',
    },
    [
      div(
        {'class': 'max-w-7xl mx-auto flex items-center justify-between w-full'},
        [
          // Brand Logo
          a(
            {
              'href': '#',
              'id': 'nav-logo',
              'class': 'flex items-center gap-3 group no-underline',
            },
            [
              div(
                {
                  'class': 'w-11 h-11 rounded-2xl bg-gradient-to-tr from-primary-600 via-accent-500 to-indigo-600 flex items-center justify-center text-white shadow-lg shadow-primary-500/25 group-hover:scale-105 transition-transform duration-300',
                },
                [
                  span({'class': 'text-2xl font-black tracking-wider'}, [Text('H')]),
                ],
              ),
              div(
                {'class': 'flex flex-col'},
                [
                  span(
                    {
                      'class': 'text-xl font-black text-surface-900 dark:text-white leading-none tracking-tight group-hover:text-primary-600 dark:group-hover:text-primary-400 transition-colors',
                    },
                    [Text('HelpHub')],
                  ),
                  span(
                    {
                      'class': 'text-[11px] text-primary-600 dark:text-primary-400 font-extrabold uppercase tracking-widest mt-0.5',
                    },
                    [Text('Local & Campus Network')],
                  ),
                ],
              ),
            ],
          ),

          // Center Navigation Links
          nav(
            {'class': 'hidden lg:flex items-center gap-1 bg-surface-100/70 dark:bg-surface-800/70 p-1.5 rounded-2xl border border-surface-200/50 dark:border-surface-700/50'},
            [
              a(
                {
                  'href': '#feed',
                  'id': 'nav-feed',
                  'class': 'px-3.5 py-1.5 text-xs font-bold rounded-xl text-primary-600 dark:text-primary-400 bg-white dark:bg-surface-900 shadow-sm transition-all',
                },
                [Text('⚡ Live Feed')],
              ),
              a(
                {
                  'href': '#tools-registry',
                  'id': 'nav-tools-link',
                  'class': 'px-3 py-1.5 text-xs font-semibold rounded-xl text-surface-600 dark:text-surface-300 hover:text-primary-600 hover:bg-white/60 dark:hover:bg-surface-800/60 transition-all',
                },
                [Text('🔧 Borrow Tools')],
              ),
              a(
                {
                  'href': '#volunteer-drives',
                  'id': 'nav-volunteer-link',
                  'class': 'px-3 py-1.5 text-xs font-semibold rounded-xl text-surface-600 dark:text-surface-300 hover:text-primary-600 hover:bg-white/60 dark:hover:bg-surface-800/60 transition-all',
                },
                [Text('🧹 Volunteer Drives')],
              ),
              a(
                {
                  'href': '#skill-marketplace',
                  'id': 'nav-skills-link',
                  'class': 'px-3 py-1.5 text-xs font-semibold rounded-xl text-surface-600 dark:text-surface-300 hover:text-primary-600 hover:bg-white/60 dark:hover:bg-surface-800/60 transition-all',
                },
                [Text('🌱 Skill Offers')],
              ),
              a(
                {
                  'href': '#community-circles',
                  'id': 'nav-groups-link',
                  'class': 'px-3 py-1.5 text-xs font-semibold rounded-xl text-surface-600 dark:text-surface-300 hover:text-primary-600 hover:bg-white/60 dark:hover:bg-surface-800/60 transition-all',
                },
                [Text('🚲 Circles')],
              ),
              a(
                {
                  'href': '#carpool-rideshare',
                  'id': 'nav-carpool-link',
                  'class': 'px-3 py-1.5 text-xs font-semibold rounded-xl text-surface-600 dark:text-surface-300 hover:text-primary-600 hover:bg-white/60 dark:hover:bg-surface-800/60 transition-all',
                },
                [Text('🚗 Carpool')],
              ),
              a(
                {
                  'href': '#lost-found-board',
                  'id': 'nav-lostfound-link',
                  'class': 'px-3 py-1.5 text-xs font-semibold rounded-xl text-surface-600 dark:text-surface-300 hover:text-primary-600 hover:bg-white/60 dark:hover:bg-surface-800/60 transition-all',
                },
                [Text('🔎 Lost & Found')],
              ),
            ],
          ),

          // Right Actions Bar
          div(
            {'class': 'flex items-center gap-3'},
            [
              button(
                {
                  'id': 'notifications-bell-btn',
                  'class': 'icon-btn relative cursor-pointer',
                  'type': 'button',
                  'title': 'Notifications',
                },
                [
                  span({'class': 'text-xl'}, [Text('🔔')]),
                  span(
                    {
                      'id': 'notif-badge-count',
                      'class': 'absolute -top-1 -right-1 bg-rose-600 text-white text-[10px] font-black w-4 h-4 rounded-full flex items-center justify-center shadow-md animate-bounce hidden',
                    },
                    [Text('0')],
                  ),
                ],
              ),

              button(
                {
                  'id': 'dark-mode-toggle',
                  'class': 'icon-btn',
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
                      'class': 'btn-ghost text-xs font-bold',
                    },
                    [Text('Log in')],
                  ),
                  a(
                    {
                      'href': '#',
                      'id': 'nav-signup',
                      'class': 'btn-primary px-4 py-2.5 text-xs font-bold rounded-xl shadow-md shadow-primary-500/20',
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
                      'class': 'flex items-center gap-2 bg-primary-50 dark:bg-primary-950/60 px-3 py-1.5 rounded-full border border-primary-200 dark:border-primary-800',
                    },
                    [
                      span({
                        'class': 'w-2.5 h-2.5 rounded-full bg-emerald-500 animate-ping',
                      }, []),
                      span({
                        'id': 'user-email',
                        'class': 'text-xs text-primary-900 dark:text-primary-200 font-bold',
                      }, []),
                    ],
                  ),
                  button(
                    {
                      'id': 'nav-signout',
                      'class': 'btn-ghost text-xs font-bold text-rose-600 hover:bg-rose-50 dark:hover:bg-rose-950/40 rounded-xl px-3 py-1.5',
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

/// Renders the main Hero and Feed UI for HelpHub using UnoCSS utilities.
Component landingHero() {
  return div(
    {
      'id': 'home-page',
      'class': 'min-h-screen bg-surface-50 dark:bg-surface-950 text-surface-900 dark:text-surface-100 pb-20 relative overflow-hidden',
    },
    [
      // Hero Header Banner
      div(
        {
          'class': 'relative pt-16 pb-20 px-6 border-b border-surface-200/50 dark:border-surface-800/50 bg-gradient-to-b from-primary-500/10 via-surface-50 to-surface-50 dark:from-primary-950/20 dark:via-surface-950 dark:to-surface-950',
        },
        [
          div(
            {
              'class': 'max-w-5xl mx-auto text-center flex flex-col items-center relative z-10',
            },
            [
              button(
                {
                  'id': 'open-sos-modal-btn',
                  'class': 'inline-flex items-center gap-2 px-6 py-2.5 rounded-full bg-gradient-to-r from-rose-600 to-red-600 text-white text-xs font-black tracking-wider mb-6 shadow-xl shadow-rose-600/30 hover:scale-105 hover:shadow-rose-600/40 transition-all cursor-pointer border border-rose-400 animate-pulse',
                },
                [
                  span({'class': 'text-sm'}, [Text('🚨')]),
                  Text('DISPATCH EMERGENCY SOS FAVOR'),
                ],
              ),

              h1(
                {
                  'class': 'text-5xl sm:text-6xl lg:text-7xl font-black text-surface-900 dark:text-white tracking-tight leading-[1.08] mb-6',
                },
                [
                  Text('Neighbors helping neighbors, '),
                  br([]),
                  span(
                    {
                      'class': 'gradient-text',
                    },
                    [Text('in real time.')],
                  ),
                ],
              ),

              p(
                {
                  'class': 'text-lg md:text-xl text-surface-600 dark:text-surface-300 max-w-2xl mb-10 leading-relaxed font-normal',
                },
                [
                  Text(
                    'Borrow tools, request quick errands, pet sitting, or tech support from verified neighbors and campus peers near you in seconds.',
                  ),
                ],
              ),

              div(
                {
                  'class': 'flex flex-wrap items-center justify-center gap-4 mb-12',
                },
                [
                  button(
                    {
                      'id': 'open-create-modal-btn',
                      'class': 'btn-primary px-7 py-3.5 text-sm font-bold shadow-xl shadow-primary-500/25 hover:shadow-2xl hover:shadow-primary-500/35 transition-all',
                    },
                    [
                      span({'class': 'text-lg'}, [Text('➕')]),
                      Text('Post a Help Request'),
                    ],
                  ),
                  a(
                    {
                      'href': '#feed',
                      'class': 'btn-secondary px-7 py-3.5 text-sm font-bold shadow-md hover:shadow-lg transition-all',
                    },
                    [
                      span({'class': 'text-base'}, [Text('🔍')]),
                      Text('Browse Live Requests'),
                    ],
                  ),
                ],
              ),

              // Live Community Stats Banner
              div(
                {
                  'id': 'community-stats-bar',
                  'class': 'grid grid-cols-2 sm:grid-cols-4 gap-6 p-6 rounded-3xl glass-card w-full max-w-4xl border border-surface-200/80 dark:border-surface-800/80 shadow-xl',
                },
                [
                  div({'class': 'p-2 flex flex-col items-center justify-center'}, [
                    span(
                      {
                        'id': 'stat-open-count',
                        'class': 'block text-3xl font-black text-emerald-600 dark:text-emerald-400 tracking-tight',
                      },
                      [Text('0')],
                    ),
                    span(
                      {
                        'class': 'text-[11px] text-surface-500 font-extrabold uppercase tracking-widest mt-1',
                      },
                      [Text('Open Favors')],
                    ),
                  ]),
                  div({'class': 'p-2 flex flex-col items-center justify-center'}, [
                    span(
                      {
                        'id': 'stat-progress-count',
                        'class': 'block text-3xl font-black text-amber-500 tracking-tight',
                      },
                      [Text('0')],
                    ),
                    span(
                      {
                        'class': 'text-[11px] text-surface-500 font-extrabold uppercase tracking-widest mt-1',
                      },
                      [Text('In Progress')],
                    ),
                  ]),
                  div({'class': 'p-2 flex flex-col items-center justify-center'}, [
                    span(
                      {
                        'id': 'stat-completed-count',
                        'class': 'block text-3xl font-black text-primary-600 dark:text-primary-400 tracking-tight',
                      },
                      [Text('0')],
                    ),
                    span(
                      {
                        'class': 'text-[11px] text-surface-500 font-extrabold uppercase tracking-widest mt-1',
                      },
                      [Text('Completed')],
                    ),
                  ]),
                  div({'class': 'p-2 flex flex-col items-center justify-center'}, [
                    span(
                      {
                        'id': 'stat-points-count',
                        'class': 'block text-3xl font-black text-accent-500 tracking-tight',
                      },
                      [Text('0')],
                    ),
                    span(
                      {
                        'class': 'text-[11px] text-surface-500 font-extrabold uppercase tracking-widest mt-1',
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
        {'class': 'max-w-7xl mx-auto px-6 mt-10'},
        [
          div(
            {
              'id': 'announcements-container',
              'class': 'p-5 rounded-3xl bg-gradient-to-r from-primary-500/10 via-accent-500/10 to-indigo-500/10 dark:from-primary-950/50 dark:via-accent-950/50 dark:to-indigo-950/50 border border-primary-200/70 dark:border-primary-800/70 flex items-center gap-4 shadow-sm',
            },
            [
              div(
                {'class': 'w-12 h-12 rounded-2xl bg-primary-500 text-white flex items-center justify-center text-2xl shadow-md shadow-primary-500/30 flex-shrink-0'},
                [Text('📢')],
              ),
              div(
                {'class': 'flex-1'},
                [
                  h4(
                    {
                      'class': 'text-sm font-black text-surface-900 dark:text-white uppercase tracking-wider',
                    },
                    [Text('Community Network Announcement')],
                  ),
                  p(
                    {
                      'class': 'text-xs text-surface-600 dark:text-surface-300 mt-1 font-medium leading-relaxed',
                    },
                    [
                      Text(
                        'Welcome to HelpHub Community Network! Connect with verified local neighbors and students to share tools, request errands, and organize volunteer drives.',
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      // Profile Bar & Stats Dashboard Card
      div(
        {'class': 'max-w-7xl mx-auto px-6 mt-10'},
        [
          div(
            {
              'class': 'p-6 sm:p-8 rounded-3xl card flex flex-col lg:flex-row lg:items-center justify-between gap-6 border border-surface-200/80 dark:border-surface-800/80 shadow-lg',
            },
            [
              div(
                {'class': 'flex items-center gap-5'},
                [
                  div(
                    {
                      'class': 'w-16 h-16 rounded-2xl bg-gradient-to-tr from-primary-500 to-accent-500 text-white flex items-center justify-center text-3xl font-black relative shadow-lg shadow-primary-500/20 flex-shrink-0',
                    },
                    [
                      span({'id': 'profile-avatar-char'}, [Text('👤')]),
                    ],
                  ),
                  div([
                    div(
                      {'class': 'flex items-center gap-3'},
                      [
                        h3(
                          {
                            'id': 'profile-name',
                            'class': 'text-lg font-black text-surface-900 dark:text-white tracking-tight',
                          },
                          [Text('Guest User')],
                        ),
                        span(
                          {
                            'id': 'profile-rating-badge',
                            'class': 'text-xs font-black text-amber-600 dark:text-amber-400 bg-amber-50 dark:bg-amber-950/60 px-2.5 py-1 rounded-lg border border-amber-200 dark:border-amber-800 shadow-sm',
                          },
                          [Text('⭐ 5.0')],
                        ),
                        button(
                          {
                            'id': 'open-edit-profile-btn',
                            'class': 'text-xs font-bold text-primary-600 hover:text-primary-700 bg-primary-50 dark:bg-primary-950/60 border border-primary-200 dark:border-primary-800 px-3 py-1 rounded-lg cursor-pointer transition-all',
                          },
                          [Text('✏️ Edit Profile')],
                        ),
                      ],
                    ),
                    p(
                      {
                        'id': 'profile-badge',
                        'class': 'text-xs text-primary-600 dark:text-primary-400 font-extrabold uppercase tracking-wider mt-1',
                      },
                      [Text('🌱 Community Helper')],
                    ),
                    div(
                      {
                        'id': 'profile-skills-tags',
                        'class': 'flex flex-wrap gap-2 mt-2',
                      },
                      [
                        span(
                          {
                            'class': 'text-[11px] px-2.5 py-0.5 bg-surface-100 dark:bg-surface-800 rounded-md font-bold text-surface-700 dark:text-surface-300 border border-surface-200/50 dark:border-surface-700/50',
                          },
                          [Text('🛠️ General Favors')],
                        ),
                      ],
                    ),
                  ]),
                ],
              ),

              // Milestone Rank Progress
              div(
                {'class': 'flex-1 max-w-sm'},
                [
                  div(
                    {
                      'class': 'flex justify-between text-xs font-black text-surface-500 uppercase tracking-wider mb-2',
                    },
                    [
                      Text('Next Rank Milestone'),
                      span({'id': 'milestone-text'}, [Text('0 / 5 Favors')]),
                    ],
                  ),
                  div(
                    {
                      'class': 'w-full bg-surface-100 dark:bg-surface-800 rounded-full h-3 overflow-hidden p-0.5 border border-surface-200/50 dark:border-surface-700/50',
                    },
                    [
                      div({
                        'id': 'milestone-bar',
                        'class': 'bg-gradient-to-r from-primary-500 to-accent-500 h-2 rounded-full transition-all duration-500',
                        'style': 'width: 20%',
                      }, []),
                    ],
                  ),
                ],
              ),

              div(
                {'class': 'flex items-center gap-8 text-center bg-surface-50 dark:bg-surface-800/50 p-4 rounded-2xl border border-surface-200/50 dark:border-surface-700/50'},
                [
                  div([
                    span(
                      {
                        'id': 'profile-points',
                        'class': 'block text-2xl font-black text-accent-500',
                      },
                      [Text('50')],
                    ),
                    span(
                      {
                        'class': 'text-[10px] text-surface-500 font-black uppercase tracking-widest',
                      },
                      [Text('Reward Pts')],
                    ),
                  ]),
                  div({
                    'class': 'w-px h-10 bg-surface-200 dark:bg-surface-700',
                  }, []),
                  div([
                    span(
                      {
                        'id': 'profile-completed',
                        'class': 'block text-2xl font-black text-emerald-500',
                      },
                      [Text('0')],
                    ),
                    span(
                      {
                        'class': 'text-[10px] text-surface-500 font-black uppercase tracking-widest',
                      },
                      [Text('Done')],
                    ),
                  ]),
                  div({
                    'class': 'w-px h-10 bg-surface-200 dark:bg-surface-700',
                  }, []),
                  div([
                    span(
                      {
                        'id': 'profile-requested',
                        'class': 'block text-2xl font-black text-primary-500',
                      },
                      [Text('0')],
                    ),
                    span(
                      {
                        'class': 'text-[10px] text-surface-500 font-black uppercase tracking-widest',
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

      // Tool & Equipment Borrowing Registry
      div(
        {'id': 'tools-registry', 'class': 'max-w-7xl mx-auto px-6 mt-16'},
        [
          div(
            {'class': 'flex items-center justify-between mb-6'},
            [
              h2(
                {
                  'class': 'text-2xl font-black text-surface-900 dark:text-white flex items-center gap-3 tracking-tight',
                },
                [
                  span({'class': 'text-3xl'}, [Text('🔧')]),
                  Text('Tool & Equipment Borrowing Registry'),
                ],
              ),
            ],
          ),
          div({
            'id': 'borrow-items-container',
            'class': 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6',
          }, []),
        ],
      ),

      // Peer Study Groups & Tutoring Sprints
      div(
        {'id': 'study-sessions', 'class': 'max-w-7xl mx-auto px-6 mt-16'},
        [
          div(
            {'class': 'flex items-center justify-between mb-6'},
            [
              h2(
                {
                  'class': 'text-2xl font-black text-surface-900 dark:text-white flex items-center gap-3 tracking-tight',
                },
                [
                  span({'class': 'text-3xl'}, [Text('📚')]),
                  Text('Peer Study Sprints & Tutoring Circles'),
                ],
              ),
            ],
          ),
          div({
            'id': 'study-container',
            'class': 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6',
          }, []),
        ],
      ),

      // Campus Pantry & Surplus Food Share
      div(
        {'id': 'food-pantry', 'class': 'max-w-7xl mx-auto px-6 mt-16'},
        [
          div(
            {'class': 'flex items-center justify-between mb-6'},
            [
              h2(
                {
                  'class': 'text-2xl font-black text-surface-900 dark:text-white flex items-center gap-3 tracking-tight',
                },
                [
                  span({'class': 'text-3xl'}, [Text('🍲')]),
                  Text('Campus Pantry & Surplus Food Share'),
                ],
              ),
            ],
          ),
          div({
            'id': 'food-container',
            'class': 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6',
          }, []),
        ],
      ),

      // Campus & Local Carpool Rideshare
      div(
        {'id': 'carpool-rideshare', 'class': 'max-w-7xl mx-auto px-6 mt-16'},
        [
          div(
            {'class': 'flex items-center justify-between mb-6'},
            [
              h2(
                {
                  'class': 'text-2xl font-black text-surface-900 dark:text-white flex items-center gap-3 tracking-tight',
                },
                [
                  span({'class': 'text-3xl'}, [Text('🚗')]),
                  Text('Campus & Local Carpool Rideshare'),
                ],
              ),
            ],
          ),
          div({
            'id': 'carpool-container',
            'class': 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6',
          }, []),
        ],
      ),

      // Campus Lost & Found Board
      div(
        {'id': 'lost-found-board', 'class': 'max-w-7xl mx-auto px-6 mt-16'},
        [
          div(
            {'class': 'flex items-center justify-between mb-6'},
            [
              h2(
                {
                  'class': 'text-2xl font-black text-surface-900 dark:text-white flex items-center gap-3 tracking-tight',
                },
                [
                  span({'class': 'text-3xl'}, [Text('🔎')]),
                  Text('Campus Lost & Found Board'),
                ],
              ),
            ],
          ),
          div({
            'id': 'lost-found-container',
            'class': 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6',
          }, []),
        ],
      ),

      // Community Volunteer Drives & Events
      div(
        {'id': 'volunteer-drives', 'class': 'max-w-7xl mx-auto px-6 mt-16'},
        [
          div(
            {'class': 'flex items-center justify-between mb-6'},
            [
              h2(
                {
                  'class': 'text-2xl font-black text-surface-900 dark:text-white flex items-center gap-3 tracking-tight',
                },
                [
                  span({'class': 'text-3xl'}, [Text('🧹')]),
                  Text('Community Volunteer Drives & Events'),
                ],
              ),
            ],
          ),
          div({
            'id': 'volunteer-events-container',
            'class': 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6',
          }, []),
        ],
      ),

      // Skill Offers & Free Item Sharing Marketplace
      div(
        {'id': 'skill-marketplace', 'class': 'max-w-7xl mx-auto px-6 mt-16'},
        [
          div(
            {'class': 'flex items-center justify-between mb-6'},
            [
              h2(
                {
                  'class': 'text-2xl font-black text-surface-900 dark:text-white flex items-center gap-3 tracking-tight',
                },
                [
                  span({'class': 'text-3xl'}, [Text('🌱')]),
                  Text('Skill Offers & Free Item Sharing'),
                ],
              ),
              button(
                {
                  'id': 'open-offer-modal-btn',
                  'class': 'px-4 py-2 text-xs font-bold text-white bg-teal-600 hover:bg-teal-700 rounded-xl shadow-md transition-all cursor-pointer',
                },
                [Text('➕ Offer Skill or Item')],
              ),
            ],
          ),
          div({
            'id': 'offers-container',
            'class': 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6',
          }, []),
        ],
      ),

      // Neighborhood Circles & Special Interest Groups
      div(
        {'id': 'community-circles', 'class': 'max-w-7xl mx-auto px-6 mt-16'},
        [
          div(
            {'class': 'flex items-center justify-between mb-6'},
            [
              h2(
                {
                  'class': 'text-2xl font-black text-surface-900 dark:text-white flex items-center gap-3 tracking-tight',
                },
                [
                  span({'class': 'text-3xl'}, [Text('🚲')]),
                  Text('Neighborhood Circles & Interest Groups'),
                ],
              ),
            ],
          ),
          div({
            'id': 'groups-container',
            'class': 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6',
          }, []),
        ],
      ),

      // Leaderboard & Live Activity Stream
      div(
        {
          'id': 'leaderboard',
          'class': 'max-w-7xl mx-auto px-6 mt-16 grid grid-cols-1 lg:grid-cols-3 gap-8',
        },
        [
          div(
            {
              'class': 'lg:col-span-2 bg-gradient-to-r from-primary-900/10 via-accent-900/10 to-transparent p-8 rounded-3xl border border-primary-200/60 dark:border-primary-800/60 shadow-lg',
            },
            [
              div(
                {'class': 'flex items-center justify-between mb-6'},
                [
                  h2(
                    {
                      'class': 'text-2xl font-black text-surface-900 dark:text-white flex items-center gap-3 tracking-tight',
                    },
                    [
                      span({'class': 'text-3xl'}, [Text('🏆')]),
                      Text('Top Community Helpers'),
                    ],
                  ),
                  span(
                    {
                      'class': 'text-xs text-primary-600 dark:text-primary-400 font-extrabold uppercase tracking-wider',
                    },
                    [Text('Live Rankings')],
                  ),
                ],
              ),
              div({
                'id': 'leaderboard-container',
                'class': 'grid grid-cols-1 sm:grid-cols-2 gap-4',
              }, []),
            ],
          ),

          // Live Activity Timeline
          div(
            {
              'id': 'activity-stream',
              'class': 'card p-6 flex flex-col justify-between border border-surface-200/80 dark:border-surface-800/80 shadow-lg',
            },
            [
              h3(
                {
                  'class': 'text-lg font-black text-surface-900 dark:text-white mb-4 flex items-center gap-2.5 tracking-tight',
                },
                [
                  span({'class': 'text-xl'}, [Text('⚡')]),
                  Text('Live Community Timeline'),
                ],
              ),
              div({
                'id': 'activity-stream-container',
                'class': 'space-y-3 max-h-60 overflow-y-auto text-xs font-medium',
              }, []),
            ],
          ),
        ],
      ),

      // Live Requests Feed Section
      div(
        {'id': 'feed', 'class': 'max-w-7xl mx-auto px-6 mt-16'},
        [
          // Filter Controls Header
          div(
            {
              'class': 'flex flex-col md:flex-row md:items-center justify-between gap-6 mb-6',
            },
            [
              h2(
                {
                  'class': 'text-3xl font-black text-surface-900 dark:text-white flex items-center gap-3 tracking-tight',
                },
                [
                  span({
                    'class': 'w-4 h-4 rounded-full bg-emerald-500 animate-ping',
                  }, []),
                  Text('Live Requests Feed'),
                ],
              ),

              // Activity Mode Tabs (All, My Posted, My Claimed, Saved)
              div(
                {
                  'id': 'activity-mode-tabs',
                  'class': 'inline-flex p-1.5 bg-surface-200/70 dark:bg-surface-800/70 rounded-2xl gap-1 text-xs font-bold border border-surface-300/50 dark:border-surface-700/50',
                },
                [
                  button(
                    {
                      'id': 'tab-all',
                      'class': 'px-4 py-2 rounded-xl bg-primary-600 text-white shadow-md transition-all cursor-pointer',
                      'data-mode': 'all',
                    },
                    [Text('🌐 All Favors')],
                  ),
                  button(
                    {
                      'id': 'tab-posted',
                      'class': 'px-4 py-2 rounded-xl text-surface-600 dark:text-surface-300 hover:text-primary-600 transition-all cursor-pointer',
                      'data-mode': 'posted',
                    },
                    [Text('📝 My Posted')],
                  ),
                  button(
                    {
                      'id': 'tab-claimed',
                      'class': 'px-4 py-2 rounded-xl text-surface-600 dark:text-surface-300 hover:text-primary-600 transition-all cursor-pointer',
                      'data-mode': 'claimed',
                    },
                    [Text('🤝 My Claimed')],
                  ),
                  button(
                    {
                      'id': 'tab-saved',
                      'class': 'px-4 py-2 rounded-xl text-surface-600 dark:text-surface-300 hover:text-primary-600 transition-all cursor-pointer',
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
            {'class': 'flex flex-wrap items-center justify-between gap-4 mb-6'},
            [
              div(
                {'class': 'flex flex-wrap items-center gap-2'},
                [
                  span(
                    {'class': 'text-xs font-black text-surface-500 uppercase tracking-wider mr-1'},
                    [Text('Popular:')],
                  ),
                  button(
                    {
                      'class': 'tag-chip px-3.5 py-1.5 text-xs font-bold rounded-xl bg-white dark:bg-surface-900 hover:bg-primary-50 hover:text-primary-600 border border-surface-200 dark:border-surface-800 shadow-sm transition-all cursor-pointer',
                      'data-tag': 'ladder',
                    },
                    [Text('🛠️ #Tools')],
                  ),
                  button(
                    {
                      'class': 'tag-chip px-3.5 py-1.5 text-xs font-bold rounded-xl bg-white dark:bg-surface-900 hover:bg-primary-50 hover:text-primary-600 border border-surface-200 dark:border-surface-800 shadow-sm transition-all cursor-pointer',
                      'data-tag': 'grocery',
                    },
                    [Text('🛵 #Grocery')],
                  ),
                  button(
                    {
                      'class': 'tag-chip px-3.5 py-1.5 text-xs font-bold rounded-xl bg-white dark:bg-surface-900 hover:bg-primary-50 hover:text-primary-600 border border-surface-200 dark:border-surface-800 shadow-sm transition-all cursor-pointer',
                      'data-tag': 'math',
                    },
                    [Text('📚 #Study')],
                  ),
                  button(
                    {
                      'class': 'tag-chip px-3.5 py-1.5 text-xs font-bold rounded-xl bg-white dark:bg-surface-900 hover:bg-primary-50 hover:text-primary-600 border border-surface-200 dark:border-surface-800 shadow-sm transition-all cursor-pointer',
                      'data-tag': 'cat',
                    },
                    [Text('🐱 #PetCare')],
                  ),
                ],
              ),

              button(
                {
                  'id': 'reset-filters-btn',
                  'class': 'px-3.5 py-1.5 text-xs font-bold text-rose-600 hover:underline cursor-pointer border border-rose-200 dark:border-rose-900 rounded-xl bg-rose-50/60 dark:bg-rose-950/40 transition-all',
                },
                [Text('🔄 Reset Filters')],
              ),
            ],
          ),

          div(
            {'class': 'flex flex-wrap items-center gap-3.5 mb-8'},
            [
              // Emergency Toggle Filter
              button(
                {
                  'id': 'toggle-emergency-btn',
                  'type': 'button',
                  'class': 'px-4 py-2.5 text-xs font-black rounded-xl border border-rose-300 dark:border-rose-800 bg-rose-50 dark:bg-rose-950/40 text-rose-700 dark:text-rose-300 flex items-center gap-2 shadow-sm transition-all cursor-pointer',
                },
                [
                  span({'class': 'text-sm'}, [Text('🚨')]),
                  span(
                    {'id': 'emergency-toggle-text'},
                    [Text('Emergency Only: OFF')],
                  ),
                ],
              ),

              // Search Bar Input
              input({
                'id': 'search-input',
                'type': 'text',
                'placeholder': 'Search requests...',
                'class': 'px-4 py-2.5 text-sm rounded-xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 focus:outline-none focus:border-primary-500 shadow-sm w-48 md:w-60 font-medium',
              }),

              // Neighborhood Zone Filter
              select(
                {
                  'id': 'zone-filter',
                  'class': 'px-4 py-2.5 text-sm rounded-xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 text-surface-800 dark:text-surface-200 focus:outline-none focus:border-primary-500 shadow-sm font-medium',
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
                  'class': 'px-4 py-2.5 text-sm rounded-xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 text-surface-800 dark:text-surface-200 focus:outline-none focus:border-primary-500 shadow-sm font-medium',
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
                  'class': 'px-4 py-2.5 text-sm rounded-xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 text-surface-800 dark:text-surface-200 focus:outline-none focus:border-primary-500 shadow-sm font-medium',
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
                  'class': 'px-4 py-2.5 text-sm rounded-xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 text-surface-800 dark:text-surface-200 focus:outline-none focus:border-primary-500 shadow-sm font-medium',
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
            'class': 'grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6',
          }, []),
        ],
      ),

      // Modal Dialogs
      _createRequestModal(),
      _commentsModal(),
      _notificationsModal(),
      _ratingModal(),
      _editProfileModal(),
      _sosModal(),
      _chatModal(),
      _proofModal(),
    ],
  );
}

Component _createRequestModal() {
  return div(
    {
      'id': 'create-modal',
      'class': 'fixed inset-0 z-50 bg-black/70 backdrop-blur-md flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 rounded-3xl max-w-lg w-full p-8 shadow-2xl relative',
        },
        [
          button(
            {
              'id': 'close-create-modal-btn',
              'class': 'absolute top-5 right-5 text-surface-400 hover:text-surface-700 dark:hover:text-white text-2xl font-bold cursor-pointer transition-colors',
            },
            [Text('✕')],
          ),
          h2(
            {
              'class': 'text-2xl font-black text-surface-900 dark:text-white mb-1 tracking-tight',
            },
            [Text('Post a Help Request')],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-6 font-medium'},
            [
              Text(
                'Describe what favor or item you need and offer reward points for neighbors who assist!',
              ),
            ],
          ),

          div(
            {'class': 'flex flex-col gap-4'},
            [
              div([
                label(
                  {
                    'class': 'block text-xs font-bold text-surface-700 dark:text-surface-300 mb-1.5 uppercase tracking-wider',
                  },
                  [Text('Title')],
                ),
                input({
                  'id': 'req-title',
                  'type': 'text',
                  'placeholder': 'e.g., Need jumper cables for car',
                  'class': 'w-full px-4 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-primary-500 font-medium',
                }),
              ]),

              div(
                {'class': 'grid grid-cols-2 gap-4'},
                [
                  div([
                    label(
                      {
                        'class': 'block text-xs font-bold text-surface-700 dark:text-surface-300 mb-1.5 uppercase tracking-wider',
                      },
                      [Text('Category')],
                    ),
                    select(
                      {
                        'id': 'req-category',
                        'class': 'w-full px-3.5 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-primary-500 font-medium',
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
                        'class': 'block text-xs font-bold text-surface-700 dark:text-surface-300 mb-1.5 uppercase tracking-wider',
                      },
                      [Text('Urgency')],
                    ),
                    select(
                      {
                        'id': 'req-urgency',
                        'class': 'w-full px-3.5 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-primary-500 font-medium',
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
                {'class': 'grid grid-cols-2 gap-4'},
                [
                  div([
                    label(
                      {
                        'class': 'block text-xs font-bold text-surface-700 dark:text-surface-300 mb-1.5 uppercase tracking-wider',
                      },
                      [Text('Neighborhood Zone')],
                    ),
                    select(
                      {
                        'id': 'req-zone',
                        'class': 'w-full px-3.5 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-primary-500 font-medium',
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
                        'class': 'block text-xs font-bold text-surface-700 dark:text-surface-300 mb-1.5 uppercase tracking-wider',
                      },
                      [Text('Est. Duration')],
                    ),
                    select(
                      {
                        'id': 'req-duration',
                        'class': 'w-full px-3.5 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-primary-500 font-medium',
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
                {'class': 'grid grid-cols-2 gap-4'},
                [
                  div([
                    label(
                      {
                        'class': 'block text-xs font-bold text-surface-700 dark:text-surface-300 mb-1.5 uppercase tracking-wider',
                      },
                      [Text('Location Detail')],
                    ),
                    input({
                      'id': 'req-location',
                      'type': 'text',
                      'placeholder': 'e.g., Campus East Quad',
                      'class': 'w-full px-4 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-primary-500 font-medium',
                    }),
                  ]),

                  div([
                    label(
                      {
                        'class': 'block text-xs font-bold text-surface-700 dark:text-surface-300 mb-1.5 uppercase tracking-wider',
                      },
                      [Text('Reward Points')],
                    ),
                    input({
                      'id': 'req-points',
                      'type': 'number',
                      'value': '25',
                      'class': 'w-full px-4 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-primary-500 font-medium',
                    }),
                  ]),
                ],
              ),

              div([
                label(
                  {
                    'class': 'block text-xs font-bold text-surface-700 dark:text-surface-300 mb-1.5 uppercase tracking-wider',
                  },
                  [Text('Description')],
                ),
                textarea({
                  'id': 'req-description',
                  'rows': '3',
                  'placeholder': 'Provide details about what you need and time frame...',
                  'class': 'w-full px-4 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-primary-500 font-medium',
                }, [Text(' ')]),
              ]),

              div(
                {'class': 'mt-4 flex items-center justify-end gap-3'},
                [
                  button(
                    {
                      'id': 'cancel-create-btn',
                      'type': 'button',
                      'class': 'px-5 py-2.5 text-xs font-bold text-surface-600 dark:text-surface-300 hover:text-surface-900 cursor-pointer',
                    },
                    [Text('Cancel')],
                  ),
                  button(
                    {
                      'id': 'submit-create-btn',
                      'type': 'button',
                      'class': 'btn-primary text-xs font-bold px-6 py-3 rounded-xl shadow-md',
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
      'class': 'fixed inset-0 z-50 bg-black/70 backdrop-blur-md flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 rounded-3xl max-w-lg w-full p-8 shadow-2xl relative flex flex-col max-h-[85vh]',
        },
        [
          button(
            {
              'id': 'close-comments-modal-btn',
              'class': 'absolute top-5 right-5 text-surface-400 hover:text-surface-700 dark:hover:text-white text-2xl font-bold cursor-pointer transition-colors',
            },
            [Text('✕')],
          ),
          h2(
            {
              'id': 'comments-title',
              'class': 'text-2xl font-black text-surface-900 dark:text-white mb-1 tracking-tight',
            },
            [Text('Request Discussion')],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-4 font-medium'},
            [Text('Ask questions or coordinate favor timing details below.')],
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
                'class': 'flex-1 px-4 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-primary-500 font-medium',
              }),
              button(
                {
                  'id': 'submit-comment-btn',
                  'type': 'button',
                  'class': 'btn-primary px-5 py-2.5 text-xs font-bold rounded-xl shadow-md',
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
      'class': 'fixed inset-0 z-50 bg-black/70 backdrop-blur-md flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border border-primary-300 dark:border-primary-800 rounded-3xl max-w-lg w-full p-8 shadow-2xl relative flex flex-col max-h-[85vh]',
        },
        [
          button(
            {
              'id': 'close-chat-modal-btn',
              'class': 'absolute top-5 right-5 text-surface-400 hover:text-surface-700 dark:hover:text-white text-2xl font-bold cursor-pointer transition-colors',
            },
            [Text('✕')],
          ),
          h2(
            {
              'class': 'text-2xl font-black text-surface-900 dark:text-white mb-1 flex items-center gap-2 tracking-tight',
            },
            [
              span({'class': 'text-2xl'}, [Text('💬')]),
              Text('Direct Favor Chat'),
            ],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-4 font-medium'},
            [
              Text('Private real-time coordinate chat between requester and helper.'),
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
                'class': 'flex-1 px-4 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-primary-500 font-medium',
              }),
              button(
                {
                  'id': 'submit-chat-btn',
                  'type': 'button',
                  'class': 'btn-primary px-5 py-2.5 text-xs font-bold rounded-xl shadow-md',
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
      'class': 'fixed inset-0 z-50 bg-black/70 backdrop-blur-md flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border border-emerald-300 dark:border-emerald-800 rounded-3xl max-w-md w-full p-8 shadow-2xl relative text-center',
        },
        [
          button(
            {
              'id': 'close-proof-modal-btn',
              'class': 'absolute top-5 right-5 text-surface-400 hover:text-surface-700 dark:hover:text-white text-2xl font-bold cursor-pointer transition-colors',
            },
            [Text('✕')],
          ),
          div({'class': 'text-5xl mb-3'}, [Text('🎉')]),
          h2(
            {
              'class': 'text-xl font-black text-surface-900 dark:text-white mb-1 tracking-tight',
            },
            [Text('Complete Favor with Proof Note')],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-5 font-medium'},
            [
              Text('Add an optional completion note or detail for the requester.'),
            ],
          ),

          textarea({
            'id': 'proof-note-input',
            'rows': '3',
            'placeholder': 'e.g., Returned item to Dorm A desk / Picked up groceries!',
            'class': 'w-full px-4 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-emerald-500 font-medium mb-5',
          }, [Text(' ')]),

          button(
            {
              'id': 'submit-proof-btn',
              'type': 'button',
              'class': 'w-full py-3 text-xs font-black text-white bg-emerald-600 hover:bg-emerald-700 rounded-xl transition-all shadow-lg cursor-pointer uppercase tracking-wider',
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
      'class': 'fixed inset-0 z-50 bg-black/70 backdrop-blur-md flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 rounded-3xl max-w-md w-full p-8 shadow-2xl relative flex flex-col max-h-[80vh]',
        },
        [
          button(
            {
              'id': 'close-notif-modal-btn',
              'class': 'absolute top-5 right-5 text-surface-400 hover:text-surface-700 dark:hover:text-white text-2xl font-bold cursor-pointer transition-colors',
            },
            [Text('✕')],
          ),
          h2(
            {
              'class': 'text-2xl font-black text-surface-900 dark:text-white mb-1 flex items-center gap-2.5 tracking-tight',
            },
            [
              span({'class': 'text-2xl'}, [Text('🔔')]),
              Text('Notifications Feed'),
            ],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-4 font-medium'},
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
      'class': 'fixed inset-0 z-50 bg-black/70 backdrop-blur-md flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 rounded-3xl max-w-md w-full p-8 shadow-2xl relative text-center',
        },
        [
          button(
            {
              'id': 'close-rating-modal-btn',
              'class': 'absolute top-5 right-5 text-surface-400 hover:text-surface-700 dark:hover:text-white text-2xl font-bold cursor-pointer transition-colors',
            },
            [Text('✕')],
          ),
          div({'class': 'text-5xl mb-3'}, [Text('⭐')]),
          h2(
            {
              'class': 'text-xl font-black text-surface-900 dark:text-white mb-1 tracking-tight',
            },
            [Text('Rate Helper Performance')],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-5 font-medium'},
            [
              Text('Your feedback helps maintain trust in the HelpHub network.'),
            ],
          ),

          select(
            {
              'id': 'rating-score-select',
              'class': 'w-full px-4 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-primary-500 font-medium mb-4',
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
            'class': 'w-full px-4 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-primary-500 font-medium mb-5',
          }, [Text(' ')]),

          button(
            {
              'id': 'submit-rating-btn',
              'type': 'button',
              'class': 'btn-primary w-full py-3 text-xs font-black uppercase tracking-wider shadow-md',
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
      'class': 'fixed inset-0 z-50 bg-black/70 backdrop-blur-md flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 rounded-3xl max-w-md w-full p-8 shadow-2xl relative',
        },
        [
          button(
            {
              'id': 'close-edit-profile-modal-btn',
              'class': 'absolute top-5 right-5 text-surface-400 hover:text-surface-700 dark:hover:text-white text-2xl font-bold cursor-pointer transition-colors',
            },
            [Text('✕')],
          ),
          h2(
            {
              'class': 'text-xl font-black text-surface-900 dark:text-white mb-1 tracking-tight',
            },
            [Text('Edit Profile & Skills')],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-5 font-medium'},
            [Text('Customize how fellow neighbors see you on HelpHub.')],
          ),

          div(
            {'class': 'flex flex-col gap-4'},
            [
              div([
                label(
                  {
                    'class': 'block text-xs font-bold text-surface-700 dark:text-surface-300 mb-1.5 uppercase tracking-wider',
                  },
                  [Text('Display Name')],
                ),
                input({
                  'id': 'edit-profile-name-input',
                  'type': 'text',
                  'placeholder': 'e.g., Alex Rivers',
                  'class': 'w-full px-4 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-primary-500 font-medium',
                }),
              ]),

              div([
                label(
                  {
                    'class': 'block text-xs font-bold text-surface-700 dark:text-surface-300 mb-1.5 uppercase tracking-wider',
                  },
                  [Text('Skills & Specialties')],
                ),
                input({
                  'id': 'edit-profile-skills-input',
                  'type': 'text',
                  'placeholder': 'e.g., Errands, Tutoring, Tech, Bike Repair',
                  'class': 'w-full px-4 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-primary-500 font-medium',
                }),
              ]),

              button(
                {
                  'id': 'submit-edit-profile-btn',
                  'type': 'button',
                  'class': 'btn-primary w-full mt-2 py-3 text-xs font-black uppercase tracking-wider shadow-md',
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
      'class': 'fixed inset-0 z-50 bg-black/80 backdrop-blur-md flex items-center justify-center p-4 hidden',
    },
    [
      div(
        {
          'class': 'bg-white dark:bg-surface-900 border-2 border-rose-500 rounded-3xl max-w-md w-full p-8 shadow-2xl relative',
        },
        [
          button(
            {
              'id': 'close-sos-modal-btn',
              'class': 'absolute top-5 right-5 text-surface-400 hover:text-surface-700 dark:hover:text-white text-2xl font-bold cursor-pointer transition-colors',
            },
            [Text('✕')],
          ),
          div(
            {
              'class': 'flex items-center gap-2 mb-2 text-rose-600 dark:text-rose-400 font-black text-xl tracking-tight',
            },
            [
              span({'class': 'text-2xl animate-ping'}, [Text('🚨')]),
              Text('Broadcast Emergency SOS'),
            ],
          ),
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 mb-5 font-medium'},
            [
              Text('Immediately notifies top active helpers nearby for urgent assistance.'),
            ],
          ),

          div(
            {'class': 'flex flex-col gap-4'},
            [
              div([
                label(
                  {
                    'class': 'block text-xs font-bold text-surface-700 dark:text-surface-300 mb-1.5 uppercase tracking-wider',
                  },
                  [Text('Emergency Summary')],
                ),
                input({
                  'id': 'sos-title',
                  'type': 'text',
                  'placeholder': 'e.g., Dead car battery at East Lot',
                  'class': 'w-full px-4 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-rose-300 dark:border-rose-800 focus:outline-none focus:border-rose-500 font-medium',
                }),
              ]),

              div([
                label(
                  {
                    'class': 'block text-xs font-bold text-surface-700 dark:text-surface-300 mb-1.5 uppercase tracking-wider',
                  },
                  [Text('Exact Location')],
                ),
                input({
                  'id': 'sos-location',
                  'type': 'text',
                  'placeholder': 'e.g., Parking Lot C, Slot 42',
                  'class': 'w-full px-4 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-rose-500 font-medium',
                }),
              ]),

              div([
                label(
                  {
                    'class': 'block text-xs font-bold text-surface-700 dark:text-surface-300 mb-1.5 uppercase tracking-wider',
                  },
                  [Text('Urgent Details')],
                ),
                textarea({
                  'id': 'sos-desc',
                  'rows': '2',
                  'placeholder': 'Describe immediate help needed...',
                  'class': 'w-full px-4 py-2.5 text-sm rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200 dark:border-surface-700 focus:outline-none focus:border-rose-500 font-medium',
                }, [Text(' ')]),
              ]),

              button(
                {
                  'id': 'submit-sos-btn',
                  'type': 'button',
                  'class': 'w-full mt-2 py-3.5 text-xs font-black text-white bg-gradient-to-r from-rose-600 to-red-600 hover:from-rose-700 hover:to-red-700 rounded-xl transition-all shadow-xl shadow-rose-600/30 flex items-center justify-center gap-2 cursor-pointer uppercase tracking-wider',
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
      'class': 'footer border-t border-surface-200 dark:border-surface-800 py-12 bg-surface-100/60 dark:bg-surface-900/60',
    },
    [
      div(
        {'class': 'max-w-7xl mx-auto px-6 text-center'},
        [
          p(
            {'class': 'text-xs text-surface-500 dark:text-surface-400 font-medium'},
            [
              Text('© 2026 HelpHub Community Network. Powered by '),
              span(
                {'class': 'font-bold text-primary-600 dark:text-primary-400'},
                [Text('Serverpod')],
              ),
              Text(', '),
              span(
                {'class': 'font-bold text-primary-600 dark:text-primary-400'},
                [Text('Flutter')],
              ),
              Text(' & '),
              span(
                {'class': 'font-bold text-primary-600 dark:text-primary-400'},
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
