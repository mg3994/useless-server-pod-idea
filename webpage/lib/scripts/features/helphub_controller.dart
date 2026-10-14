import 'dart:js_interop';

import 'package:web/web.dart' as web;
import 'package:website_client/website_client.dart' as wc;

/// Manages interactive logic for HelpHub in the webpage frontend.
class HelpHubController {
  final wc.Client client;

  String currentCategory = 'All';
  String currentStatus = 'All';
  String currentZone = 'All';
  String currentSearch = '';
  String currentSortBy = 'newest';
  String currentActivityMode = 'all'; // 'all', 'posted', 'claimed', 'saved'
  bool emergencyOnly = false;

  int? activeCommentsRequestId;
  int? activeChatRequestId;
  int? activeProofRequestId;
  int? activeRatingRequestId;
  int? activeRatingToUserId;

  HelpHubController(this.client);

  void init() {
    _bindEvents();
    loadUserProfile();
    loadAnnouncements();
    loadLeaderboard();
    loadCommunityStats();
    loadActivityStream();
    loadHelpRequests();
    loadNotifications();
  }

  void _bindEvents() {
    // Activity Mode Tabs
    _bindActivityTabs();

    // Tag Chips
    _bindTagChips();

    // Reset Filters Button
    final resetBtn = web.document.querySelector('#reset-filters-btn');
    resetBtn?.addEventListener('click', ((web.Event e) {
      e.preventDefault();
      _resetFilters();
    }).toJS);

    // SOS Modal Events
    final openSosBtn = web.document.querySelector('#open-sos-modal-btn');
    openSosBtn?.addEventListener('click', ((web.Event e) {
      e.preventDefault();
      _toggleModal('sos-modal', show: true);
    }).toJS);

    final closeSosBtn = web.document.querySelector('#close-sos-modal-btn');
    closeSosBtn?.addEventListener('click', ((web.Event e) {
      e.preventDefault();
      _toggleModal('sos-modal', show: false);
    }).toJS);

    final submitSosBtn = web.document.querySelector('#submit-sos-btn');
    submitSosBtn?.addEventListener('click', ((web.Event e) {
      e.preventDefault();
      _submitEmergencySos();
    }).toJS);

    // Chat Modal Events
    final closeChatBtn = web.document.querySelector('#close-chat-modal-btn');
    closeChatBtn?.addEventListener('click', ((web.Event e) {
      e.preventDefault();
      _toggleModal('chat-modal', show: false);
    }).toJS);

    final submitChatBtn = web.document.querySelector('#submit-chat-btn');
    submitChatBtn?.addEventListener('click', ((web.Event e) {
      e.preventDefault();
      _submitChatMessage();
    }).toJS);

    // Proof Modal Events
    final closeProofBtn = web.document.querySelector('#close-proof-modal-btn');
    closeProofBtn?.addEventListener('click', ((web.Event e) {
      e.preventDefault();
      _toggleModal('proof-modal', show: false);
    }).toJS);

    final submitProofBtn = web.document.querySelector('#submit-proof-btn');
    submitProofBtn?.addEventListener('click', ((web.Event e) {
      e.preventDefault();
      _submitCompletionProof();
    }).toJS);

    // Toggle emergency filter button
    final emergencyBtn = web.document.querySelector('#toggle-emergency-btn');
    emergencyBtn?.addEventListener(
      'click',
      ((web.Event e) {
        e.preventDefault();
        emergencyOnly = !emergencyOnly;
        final labelEl = web.document.querySelector('#emergency-toggle-text');
        if (labelEl != null) {
          labelEl.textContent = emergencyOnly
              ? 'Emergency Only: ON ⚡'
              : 'Emergency Only: OFF';
        }
        if (emergencyOnly) {
          emergencyBtn.classList.add('bg-rose-600');
          emergencyBtn.classList.add('text-white');
        } else {
          emergencyBtn.classList.remove('bg-rose-600');
          emergencyBtn.classList.remove('text-white');
        }
        loadHelpRequests();
      }).toJS,
    );

    // Profile Edit Modal
    final editProfileBtn = web.document.querySelector('#open-edit-profile-btn');
    editProfileBtn?.addEventListener(
      'click',
      ((web.Event e) {
        e.preventDefault();
        _openEditProfileModal();
      }).toJS,
    );

    final closeEditProfileBtn = web.document.querySelector('#close-edit-profile-modal-btn');
    closeEditProfileBtn?.addEventListener(
      'click',
      ((web.Event e) {
        e.preventDefault();
        _toggleModal('edit-profile-modal', show: false);
      }).toJS,
    );

    final submitEditProfileBtn = web.document.querySelector('#submit-edit-profile-btn');
    submitEditProfileBtn?.addEventListener(
      'click',
      ((web.Event e) {
        e.preventDefault();
        _submitEditProfile();
      }).toJS,
    );

    // Open notification modal
    final notifBtn = web.document.querySelector('#notifications-bell-btn');
    notifBtn?.addEventListener(
      'click',
      ((web.Event e) {
        e.preventDefault();
        _openNotificationsModal();
      }).toJS,
    );

    final closeNotifBtn = web.document.querySelector('#close-notif-modal-btn');
    closeNotifBtn?.addEventListener(
      'click',
      ((web.Event e) {
        e.preventDefault();
        _toggleModal('notifications-modal', show: false);
      }).toJS,
    );

    // Close rating modal
    final closeRatingBtn = web.document.querySelector('#close-rating-modal-btn');
    closeRatingBtn?.addEventListener(
      'click',
      ((web.Event e) {
        e.preventDefault();
        _toggleModal('rating-modal', show: false);
      }).toJS,
    );

    // Submit rating
    final submitRatingBtn = web.document.querySelector('#submit-rating-btn');
    submitRatingBtn?.addEventListener(
      'click',
      ((web.Event e) {
        e.preventDefault();
        _submitRating();
      }).toJS,
    );

    // Open create modal
    final openBtn = web.document.querySelector('#open-create-modal-btn');
    openBtn?.addEventListener(
      'click',
      ((web.Event e) {
        e.preventDefault();
        _toggleModal('create-modal', show: true);
      }).toJS,
    );

    final shortcutBtn = web.document.querySelector('#nav-create-shortcut');
    shortcutBtn?.addEventListener(
      'click',
      ((web.Event e) {
        e.preventDefault();
        _toggleModal('create-modal', show: true);
      }).toJS,
    );

    // Close create modal
    final closeBtn = web.document.querySelector('#close-create-modal-btn');
    closeBtn?.addEventListener(
      'click',
      ((web.Event e) {
        e.preventDefault();
        _toggleModal('create-modal', show: false);
      }).toJS,
    );

    final cancelBtn = web.document.querySelector('#cancel-create-btn');
    cancelBtn?.addEventListener(
      'click',
      ((web.Event e) {
        e.preventDefault();
        _toggleModal('create-modal', show: false);
      }).toJS,
    );

    // Close comments modal
    final closeCommentsBtn = web.document.querySelector(
      '#close-comments-modal-btn',
    );
    closeCommentsBtn?.addEventListener(
      'click',
      ((web.Event e) {
        e.preventDefault();
        _toggleModal('comments-modal', show: false);
      }).toJS,
    );

    // Submit comment
    final submitCommentBtn = web.document.querySelector('#submit-comment-btn');
    submitCommentBtn?.addEventListener(
      'click',
      ((web.Event e) {
        e.preventDefault();
        _submitComment();
      }).toJS,
    );

    // Submit create request
    final submitBtn = web.document.querySelector('#submit-create-btn');
    submitBtn?.addEventListener(
      'click',
      ((web.Event e) {
        e.preventDefault();
        _submitNewRequest();
      }).toJS,
    );

    // Filters & Sorts
    final catSelect = web.document.querySelector(
      '#category-filter',
    ) as web.HTMLSelectElement?;
    catSelect?.addEventListener(
      'change',
      ((web.Event e) {
        currentCategory = catSelect.value;
        loadHelpRequests();
      }).toJS,
    );

    final zoneSelect = web.document.querySelector(
      '#zone-filter',
    ) as web.HTMLSelectElement?;
    zoneSelect?.addEventListener(
      'change',
      ((web.Event e) {
        currentZone = zoneSelect.value;
        loadHelpRequests();
      }).toJS,
    );

    final statusSelect =
        web.document.querySelector('#status-filter') as web.HTMLSelectElement?;
    statusSelect?.addEventListener(
      'change',
      ((web.Event e) {
        currentStatus = statusSelect.value;
        loadHelpRequests();
      }).toJS,
    );

    final sortSelect =
        web.document.querySelector('#sort-filter') as web.HTMLSelectElement?;
    sortSelect?.addEventListener(
      'change',
      ((web.Event e) {
        currentSortBy = sortSelect.value;
        loadHelpRequests();
      }).toJS,
    );

    final searchInput =
        web.document.querySelector('#search-input') as web.HTMLInputElement?;
    searchInput?.addEventListener(
      'input',
      ((web.Event e) {
        currentSearch = searchInput.value;
        loadHelpRequests();
      }).toJS,
    );
  }

  void _resetFilters() {
    currentCategory = 'All';
    currentStatus = 'All';
    currentZone = 'All';
    currentSearch = '';
    currentSortBy = 'newest';
    emergencyOnly = false;

    final searchInput = web.document.querySelector('#search-input') as web.HTMLInputElement?;
    if (searchInput != null) searchInput.value = '';

    final catSelect = web.document.querySelector('#category-filter') as web.HTMLSelectElement?;
    if (catSelect != null) catSelect.value = 'All';

    final zoneSelect = web.document.querySelector('#zone-filter') as web.HTMLSelectElement?;
    if (zoneSelect != null) zoneSelect.value = 'All';

    final statusSelect = web.document.querySelector('#status-filter') as web.HTMLSelectElement?;
    if (statusSelect != null) statusSelect.value = 'All';

    final sortSelect = web.document.querySelector('#sort-filter') as web.HTMLSelectElement?;
    if (sortSelect != null) sortSelect.value = 'newest';

    loadHelpRequests();
  }

  void _bindActivityTabs() {
    final tabAll = web.document.querySelector('#tab-all');
    final tabPosted = web.document.querySelector('#tab-posted');
    final tabClaimed = web.document.querySelector('#tab-claimed');
    final tabSaved = web.document.querySelector('#tab-saved');

    void updateTabStyles(String mode) {
      currentActivityMode = mode;
      final tabs = [tabAll, tabPosted, tabClaimed, tabSaved];
      for (final t in tabs) {
        if (t == null) continue;
        final modeAttr = t.getAttribute('data-mode');
        if (modeAttr == mode) {
          t.className = 'px-3 py-1.5 rounded-lg bg-indigo-600 text-white transition-all cursor-pointer';
        } else {
          t.className = 'px-3 py-1.5 rounded-lg text-surface-600 dark:text-surface-300 hover:text-indigo-600 transition-all cursor-pointer';
        }
      }
      loadHelpRequests();
    }

    tabAll?.addEventListener('click', ((web.Event e) => updateTabStyles('all')).toJS);
    tabPosted?.addEventListener('click', ((web.Event e) => updateTabStyles('posted')).toJS);
    tabClaimed?.addEventListener('click', ((web.Event e) => updateTabStyles('claimed')).toJS);
    tabSaved?.addEventListener('click', ((web.Event e) => updateTabStyles('saved')).toJS);
  }

  void _bindTagChips() {
    final tagChips = web.document.querySelectorAll('.tag-chip');
    for (var i = 0; i < tagChips.length; i++) {
      final chip = tagChips.item(i) as web.HTMLElement?;
      chip?.addEventListener('click', ((web.Event e) {
        final tag = chip.getAttribute('data-tag');
        if (tag != null) {
          final searchInput = web.document.querySelector('#search-input') as web.HTMLInputElement?;
          if (searchInput != null) {
            searchInput.value = tag;
            currentSearch = tag;
            loadHelpRequests();
          }
        }
      }).toJS);
    }
  }

  Future<void> loadCommunityStats() async {
    try {
      final stats = await client.helpRequest.getCommunityStats();
      web.document.querySelector('#stat-open-count')?.textContent = (stats['openCount'] ?? 0).toString();
      web.document.querySelector('#stat-progress-count')?.textContent = (stats['inProgressCount'] ?? 0).toString();
      web.document.querySelector('#stat-completed-count')?.textContent = (stats['completedCount'] ?? 0).toString();
      web.document.querySelector('#stat-points-count')?.textContent = (stats['totalPointsAwarded'] ?? 0).toString();
    } catch (e) {
      // Ignore
    }
  }

  Future<void> loadActivityStream() async {
    final container = web.document.querySelector('#activity-stream-container');
    if (container == null) return;

    try {
      final activities = await client.helpRequest.getCommunityActivityStream();
      container.textContent = '';

      if (activities.isEmpty) {
        container.insertAdjacentHTML('beforeend', '<p class="text-xs text-surface-400 py-2">No recent timeline activity.</p>'.toJS);
        return;
      }

      for (final a in activities) {
        final actHtml = '''
          <div class="p-2 rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200/50 dark:border-surface-700/50">
            <div class="font-bold text-indigo-900 dark:text-indigo-200">${_escapeHtml(a.title)}</div>
            <div class="text-[11px] text-surface-600 dark:text-surface-300 mt-0.5">${_escapeHtml(a.message)}</div>
          </div>
        ''';
        container.insertAdjacentHTML('beforeend', actHtml.toJS);
      }
    } catch (e) {
      // Ignore
    }
  }

  Future<void> _openChatModal(int requestId) async {
    activeChatRequestId = requestId;
    _toggleModal('chat-modal', show: true);
    await _loadChatMessagesList(requestId);
  }

  Future<void> _loadChatMessagesList(int requestId) async {
    final container = web.document.querySelector('#chat-messages-container');
    if (container == null) return;

    try {
      final messages = await client.helpRequest.getChatMessages(requestId: requestId);
      container.textContent = '';

      if (messages.isEmpty) {
        container.insertAdjacentHTML('beforeend', '<p class="text-xs text-surface-400 text-center py-4">No direct messages yet. Coordinate details here!</p>'.toJS);
        return;
      }

      for (final m in messages) {
        final msgHtml = '''
          <div class="p-2.5 rounded-xl bg-surface-50 dark:bg-surface-800 border border-indigo-100 dark:border-indigo-900">
            <div class="flex items-center justify-between mb-1">
              <span class="text-xs font-bold text-indigo-600 dark:text-indigo-400">${_escapeHtml(m.senderEmail)}</span>
              <span class="text-[10px] text-surface-400">Just now</span>
            </div>
            <p class="text-xs text-surface-800 dark:text-surface-100">${_escapeHtml(m.message)}</p>
          </div>
        ''';
        container.insertAdjacentHTML('beforeend', msgHtml.toJS);
      }
    } catch (e) {
      // Ignore
    }
  }

  Future<void> _submitChatMessage() async {
    if (activeChatRequestId == null) return;

    final inputEl = web.document.querySelector('#chat-input') as web.HTMLInputElement?;
    final text = inputEl?.value.trim() ?? '';
    if (text.isEmpty) return;

    final userEmailEl = web.document.querySelector('#user-email');
    final senderEmail = userEmailEl?.textContent ?? 'neighbor@helphub.com';

    try {
      await client.helpRequest.sendChatMessage(
        requestId: activeChatRequestId!,
        message: text,
        senderEmail: senderEmail,
      );

      if (inputEl != null) inputEl.value = '';
      await _loadChatMessagesList(activeChatRequestId!);
      await loadNotifications();
      await loadActivityStream();
    } catch (e) {
      web.window.alert('Failed to send chat message.');
    }
  }

  Future<void> _submitCompletionProof() async {
    if (activeProofRequestId == null) return;

    final inputEl = web.document.querySelector('#proof-note-input') as web.HTMLTextAreaElement?;
    final note = inputEl?.value.trim() ?? 'Favor completed successfully.';

    try {
      await client.helpRequest.completeHelpRequestWithProof(
        requestId: activeProofRequestId!,
        proofNote: note,
      );

      _toggleModal('proof-modal', show: false);
      if (inputEl != null) inputEl.value = '';

      await loadHelpRequests();
      await loadUserProfile();
      await loadLeaderboard();
      await loadCommunityStats();
      await loadNotifications();
      await loadActivityStream();
    } catch (e) {
      web.window.alert('Failed to confirm completion.');
    }
  }

  Future<void> _submitEmergencySos() async {
    final titleEl = web.document.querySelector('#sos-title') as web.HTMLInputElement?;
    final locEl = web.document.querySelector('#sos-location') as web.HTMLInputElement?;
    final descEl = web.document.querySelector('#sos-desc') as web.HTMLTextAreaElement?;

    final title = titleEl?.value.trim() ?? '';
    final location = locEl?.value.trim() ?? '';
    final desc = descEl?.value.trim() ?? '';

    if (title.isEmpty || location.isEmpty) {
      web.window.alert('Please fill in title and location for SOS dispatch.');
      return;
    }

    final userEmailEl = web.document.querySelector('#user-email');
    final creatorEmail = userEmailEl?.textContent ?? 'sos@helphub.com';

    try {
      await client.helpRequest.broadcastEmergencySOS(
        title: title,
        description: desc,
        location: location,
        creatorEmail: creatorEmail,
      );

      if (titleEl != null) titleEl.value = '';
      if (locEl != null) locEl.value = '';
      if (descEl != null) descEl.value = '';

      _toggleModal('sos-modal', show: false);
      web.window.alert('⚡ Emergency SOS Broadcast Sent! Helpers nearby have been notified.');

      await loadHelpRequests();
      await loadCommunityStats();
      await loadNotifications();
      await loadActivityStream();
    } catch (e) {
      web.window.alert('Failed to dispatch SOS alert.');
    }
  }

  Future<void> loadUserProfile() async {
    try {
      final userEmailEl = web.document.querySelector('#user-email');
      final email = userEmailEl?.textContent ?? 'guest@helphub.com';

      final profile = await client.helpRequest.getUserProfile(email: email);

      web.document.querySelector('#profile-name')?.textContent =
          profile.displayName;
      web.document.querySelector('#profile-badge')?.textContent =
          profile.avatarBadge;
      web.document.querySelector('#profile-points')?.textContent = profile
          .points
          .toString();
      web.document.querySelector('#profile-completed')?.textContent = profile
          .completedCount
          .toString();
      web.document.querySelector('#profile-requested')?.textContent = profile
          .requestedCount
          .toString();

      final ratingAvg = profile.ratingAverage ?? 5.0;
      web.document.querySelector('#profile-rating-badge')?.textContent =
          '⭐ ${ratingAvg.toStringAsFixed(1)}';

      final skillsContainer = web.document.querySelector('#profile-skills-tags');
      if (skillsContainer != null && profile.skills != null) {
        skillsContainer.textContent = '';
        final skillsList = profile.skills!.split(',');
        for (final skill in skillsList) {
          final tagHtml =
              '<span class="text-[10px] px-2 py-0.5 bg-indigo-50 dark:bg-indigo-950/60 text-indigo-600 dark:text-indigo-300 rounded-md font-semibold border border-indigo-200 dark:border-indigo-800">${_escapeHtml(skill.trim())}</span>';
          skillsContainer.insertAdjacentHTML('beforeend', tagHtml.toJS);
        }
      }

      final done = profile.completedCount;
      int target = 5;
      if (done >= 10) {
        target = 25;
      } else if (done >= 5) {
        target = 10;
      }
      final pct = ((done / target) * 100).clamp(5, 100).toInt();

      web.document.querySelector('#milestone-text')?.textContent =
          '$done / $target Favors';
      final barEl = web.document.querySelector('#milestone-bar');
      barEl?.setAttribute('style', 'width: $pct%');

      if (profile.displayName.isNotEmpty) {
        web.document.querySelector('#profile-avatar-char')?.textContent =
            profile.displayName[0].toUpperCase();
      }
    } catch (e) {
      // Fallback display
    }
  }

  Future<void> _openEditProfileModal() async {
    final userEmailEl = web.document.querySelector('#user-email');
    final email = userEmailEl?.textContent ?? 'guest@helphub.com';

    try {
      final profile = await client.helpRequest.getUserProfile(email: email);
      final nameInput = web.document.querySelector('#edit-profile-name-input') as web.HTMLInputElement?;
      final skillsInput = web.document.querySelector('#edit-profile-skills-input') as web.HTMLInputElement?;

      if (nameInput != null) nameInput.value = profile.displayName;
      if (skillsInput != null) skillsInput.value = profile.skills ?? 'General';

      _toggleModal('edit-profile-modal', show: true);
    } catch (e) {
      // Ignore
    }
  }

  Future<void> _submitEditProfile() async {
    final userEmailEl = web.document.querySelector('#user-email');
    final email = userEmailEl?.textContent ?? 'guest@helphub.com';

    final nameInput = web.document.querySelector('#edit-profile-name-input') as web.HTMLInputElement?;
    final skillsInput = web.document.querySelector('#edit-profile-skills-input') as web.HTMLInputElement?;

    final name = nameInput?.value.trim() ?? '';
    final skills = skillsInput?.value.trim() ?? '';

    try {
      await client.helpRequest.updateUserProfile(
        email: email,
        displayName: name,
        skills: skills,
      );

      _toggleModal('edit-profile-modal', show: false);
      await loadUserProfile();
      await loadLeaderboard();
    } catch (e) {
      web.window.alert('Failed to update profile.');
    }
  }

  Future<void> loadNotifications() async {
    try {
      final userEmailEl = web.document.querySelector('#user-email');
      final email = userEmailEl?.textContent ?? 'guest@helphub.com';

      final notifications = await client.helpRequest.getUserNotifications(
        userEmail: email,
      );

      final unreadCount = notifications.where((n) => !n.isRead).length;
      final badgeEl = web.document.querySelector('#notif-badge-count');
      if (badgeEl != null) {
        if (unreadCount > 0) {
          badgeEl.textContent = unreadCount.toString();
          badgeEl.classList.remove('hidden');
        } else {
          badgeEl.classList.add('hidden');
        }
      }
    } catch (e) {
      // Ignore
    }
  }

  Future<void> _openNotificationsModal() async {
    _toggleModal('notifications-modal', show: true);
    final container = web.document.querySelector('#notifications-list-container');
    if (container == null) return;

    try {
      final userEmailEl = web.document.querySelector('#user-email');
      final email = userEmailEl?.textContent ?? 'guest@helphub.com';

      final notifications = await client.helpRequest.getUserNotifications(
        userEmail: email,
      );

      container.textContent = '';

      if (notifications.isEmpty) {
        container.insertAdjacentHTML(
          'beforeend',
          '<p class="text-xs text-surface-400 text-center py-4">No notifications yet.</p>'.toJS,
        );
        return;
      }

      for (final notif in notifications) {
        final notifHtml = '''
          <div class="p-3 rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200/60 dark:border-surface-700/60 flex flex-col gap-1">
            <div class="flex items-center justify-between">
              <span class="text-xs font-bold text-indigo-900 dark:text-indigo-200">${_escapeHtml(notif.title)}</span>
              <span class="text-[10px] text-surface-400">Just now</span>
            </div>
            <p class="text-xs text-surface-600 dark:text-surface-300">${_escapeHtml(notif.message)}</p>
          </div>
        ''';
        container.insertAdjacentHTML('beforeend', notifHtml.toJS);

        if (!notif.isRead && notif.id != null) {
          await client.helpRequest.markNotificationRead(notificationId: notif.id!);
        }
      }

      loadNotifications();
    } catch (e) {
      // Ignore
    }
  }

  Future<void> loadAnnouncements() async {
    final container = web.document.querySelector('#announcements-container');
    if (container == null) return;

    try {
      final announcements = await client.helpRequest.getAnnouncements();
      if (announcements.isNotEmpty) {
        final ann = announcements.first;
        container.textContent = '';
        final annHtml =
            '''
          <span class="text-2xl">📢</span>
          <div class="flex-1">
            <h4 class="text-sm font-bold text-indigo-900 dark:text-indigo-200">${_escapeHtml(ann.title)}</h4>
            <p class="text-xs text-indigo-700 dark:text-indigo-300 mt-0.5">${_escapeHtml(ann.content)}</p>
          </div>
        ''';
        container.insertAdjacentHTML('beforeend', annHtml.toJS);
      }
    } catch (e) {
      // Ignore
    }
  }

  Future<void> loadLeaderboard() async {
    final container = web.document.querySelector('#leaderboard-container');
    if (container == null) return;

    try {
      final topUsers = await client.helpRequest.getLeaderboard();
      container.textContent = '';

      if (topUsers.isEmpty) {
        container.insertAdjacentHTML(
          'beforeend',
          '<p class="text-xs text-surface-400 col-span-full">No leaderboard entries yet.</p>'.toJS,
        );
        return;
      }

      for (var i = 0; i < topUsers.length; i++) {
        final u = topUsers[i];
        final rank = '#${i + 1}';
        final ratingAvg = u.ratingAverage ?? 5.0;

        final cardHtml =
            '''
          <div class="p-3 rounded-xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 flex items-center gap-3 shadow-sm">
            <span class="text-base font-black text-amber-500">$rank</span>
            <div class="flex-1">
              <div class="flex items-center gap-1.5">
                <h4 class="text-sm font-bold text-surface-900 dark:text-white">${_escapeHtml(u.displayName)}</h4>
                <span class="text-[10px] text-amber-500 font-bold">⭐ ${ratingAvg.toStringAsFixed(1)}</span>
              </div>
              <p class="text-xs text-indigo-600 dark:text-indigo-400 font-medium">${_escapeHtml(u.avatarBadge)}</p>
            </div>
            <span class="text-xs font-extrabold text-amber-500">${u.points} pts</span>
          </div>
        ''';
        container.insertAdjacentHTML('beforeend', cardHtml.toJS);
      }
    } catch (e) {
      // Ignore
    }
  }

  Future<void> loadHelpRequests() async {
    final container = web.document.querySelector('#requests-container');
    if (container == null) return;

    try {
      final userEmailEl = web.document.querySelector('#user-email');
      final email = userEmailEl?.textContent ?? 'user@helphub.com';

      final requests = await client.helpRequest.getHelpRequests(
        category: currentCategory,
        status: currentStatus,
        neighborhoodZone: currentZone,
        isEmergency: emergencyOnly ? true : null,
        searchQuery: currentSearch,
        sortBy: currentSortBy,
        myEmailFilter: currentActivityMode != 'all' ? email : null,
        myActivityMode: currentActivityMode != 'all' ? currentActivityMode : null,
      );

      container.textContent = '';

      if (requests.isEmpty) {
        container.insertAdjacentHTML('beforeend', '''
            <div class="col-span-full py-12 text-center text-surface-500 dark:text-surface-400">
              <span class="text-4xl block mb-2">🔍</span>
              <p class="text-base font-semibold">No help requests found.</p>
              <p class="text-xs">Be the first to create one!</p>
            </div>
          '''.toJS);
        return;
      }

      for (final req in requests) {
        final cardHtml = _buildCardHtml(req);
        container.insertAdjacentHTML('beforeend', cardHtml.toJS);
      }

      _bindCardActionButtons();
    } catch (e) {
      // Ignore
    }
  }

  String _buildCardHtml(wc.HelpRequest req) {
    String urgencyBg =
        'bg-amber-100 text-amber-800 dark:bg-amber-900/40 dark:text-amber-300';
    if (req.urgency == 'Urgent') {
      urgencyBg =
          'bg-rose-100 text-rose-800 dark:bg-rose-900/40 dark:text-rose-300';
    } else if (req.urgency == 'Low') {
      urgencyBg =
          'bg-slate-100 text-slate-800 dark:bg-slate-800 dark:text-slate-300';
    }

    String emergencyBadge = '';
    if (req.isEmergency) {
      emergencyBadge = '''
        <span class="text-[10px] font-extrabold px-2 py-0.5 rounded-full bg-rose-600 text-white animate-pulse">⚡ SOS Emergency</span>
      ''';
    }

    String statusBadge = '🟢 Open';
    if (req.status == 'In Progress') {
      statusBadge = '🟡 In Progress';
    } else if (req.status == 'Completed') {
      statusBadge = '🔵 Completed';
    } else if (req.status == 'Cancelled') {
      statusBadge = '⚪ Cancelled';
    }

    final zoneName = req.neighborhoodZone ?? 'North Campus';
    final duration = req.estimatedDuration ?? '15-30 mins';
    final upvotes = req.upvotes ?? 0;
    final proofNote = req.completionProofNote ?? '';
    final code = req.shareableCode ?? '';

    String actionButtonHtml = '';
    if (req.status == 'Open') {
      actionButtonHtml =
          '''
        <div class="flex items-center gap-1">
          <button class="share-btn px-2 py-1 text-[11px] font-bold rounded-lg text-indigo-600 bg-indigo-50 dark:bg-indigo-950/50 border border-indigo-200 dark:border-indigo-800 hover:bg-indigo-100 transition-colors" data-code="$code">
            🔗 Share
          </button>
          <button class="bookmark-btn px-2 py-1 text-[11px] font-bold rounded-lg text-indigo-600 bg-indigo-50 dark:bg-indigo-950/50 border border-indigo-200 dark:border-indigo-800 hover:bg-indigo-100 transition-colors" data-id="${req.id}">
            🔖 Save
          </button>
          <button class="upvote-btn px-2 py-1 text-[11px] font-bold rounded-lg text-emerald-700 bg-emerald-50 dark:bg-emerald-950/50 border border-emerald-200 dark:border-emerald-800 hover:bg-emerald-100 transition-colors" data-id="${req.id}">
            👍 $upvotes
          </button>
          <button class="cancel-req-btn px-2 py-1 text-[11px] font-bold rounded-lg text-rose-600 bg-rose-50 dark:bg-rose-950/50 border border-rose-200 dark:border-rose-800 hover:bg-rose-100 transition-colors" data-id="${req.id}">
            Cancel
          </button>
          <button class="boost-btn px-2 py-1 text-[11px] font-bold rounded-lg text-indigo-600 bg-indigo-50 dark:bg-indigo-950/50 border border-indigo-200 dark:border-indigo-800 hover:bg-indigo-100 transition-colors" data-id="${req.id}">
            🪙 +10
          </button>
          <button class="claim-btn px-3 py-1.5 text-xs font-semibold rounded-lg text-white bg-indigo-600 hover:bg-indigo-700 transition-colors" data-id="${req.id}">
            Claim
          </button>
        </div>
      ''';
    } else if (req.status == 'In Progress') {
      actionButtonHtml =
          '''
        <div class="flex items-center gap-1.5">
          <button class="direct-chat-btn px-2.5 py-1 text-[11px] font-bold rounded-lg text-indigo-600 bg-indigo-50 dark:bg-indigo-950/50 border border-indigo-200 dark:border-indigo-800 hover:bg-indigo-100 transition-colors" data-id="${req.id}">
            💬 Chat
          </button>
          <button class="complete-proof-btn px-3 py-1.5 text-xs font-semibold rounded-lg text-white bg-emerald-600 hover:bg-emerald-700 transition-colors" data-id="${req.id}">
            Complete
          </button>
        </div>
      ''';
    } else if (req.status == 'Completed') {
      actionButtonHtml =
          '''
        <div class="flex items-center gap-1.5">
          <button class="rate-btn px-2.5 py-1 text-[11px] font-bold rounded-lg text-indigo-600 bg-indigo-50 dark:bg-indigo-950/50 border border-indigo-200 dark:border-indigo-800 hover:bg-indigo-100 transition-colors" data-id="${req.id}" data-helper-id="${req.helperUserId}">
            ⭐ Rate
          </button>
          <button class="tip-btn px-2.5 py-1 text-[11px] font-bold rounded-lg text-amber-600 bg-amber-50 dark:bg-amber-950/50 border border-amber-200 dark:border-amber-800 hover:bg-amber-100 transition-colors" data-helper-id="${req.helperUserId}">
            🎁 Tip
          </button>
        </div>
      ''';
    } else {
      actionButtonHtml = '''<span class="text-xs font-semibold text-surface-400">Cancelled</span>''';
    }

    String proofHtml = '';
    if (proofNote.isNotEmpty && req.status == 'Completed') {
      proofHtml = '''
        <div class="mt-2 text-[11px] p-2 bg-emerald-50 dark:bg-emerald-950/40 text-emerald-800 dark:text-emerald-200 rounded-lg border border-emerald-200 dark:border-emerald-800">
          <strong>Proof Note:</strong> ${_escapeHtml(proofNote)}
        </div>
      ''';
    }

    return '''
      <div class="bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 rounded-2xl p-5 shadow-sm hover:shadow-md transition-all flex flex-col justify-between gap-4">
        <div>
          <div class="flex items-center justify-between gap-2 mb-2">
            <span class="text-xs font-semibold px-2.5 py-1 rounded-full bg-indigo-50 dark:bg-indigo-950/60 text-indigo-600 dark:text-indigo-400">${req.category}</span>
            <div class="flex items-center gap-1.5">
              $emergencyBadge
              <span class="text-xs font-semibold px-2 py-0.5 rounded-full $urgencyBg">${req.urgency}</span>
              <span class="text-xs font-medium px-2 py-0.5 rounded-full bg-surface-100 dark:bg-surface-800">$statusBadge</span>
            </div>
          </div>
          <h3 class="text-lg font-bold text-surface-900 dark:text-white mb-1 leading-snug">${_escapeHtml(req.title)}</h3>
          <div class="flex items-center gap-2 text-xs text-surface-500 dark:text-surface-400 mb-2">
            <span>📍 ${_escapeHtml(req.location)} ($zoneName)</span>
            <span>•</span>
            <span>⏱️ $duration</span>
          </div>
          <p class="text-xs text-surface-400 dark:text-surface-500 mb-2">By: ${_escapeHtml(req.creatorEmail)}</p>
          <p class="text-sm text-surface-600 dark:text-surface-300 line-clamp-3 mb-3">${_escapeHtml(req.description)}</p>
          $proofHtml
        </div>
        <div>
          <button class="comments-btn text-xs text-indigo-600 dark:text-indigo-400 font-semibold mb-3 hover:underline flex items-center gap-1" data-id="${req.id}">
            💬 Comments & Q&A
          </button>
          <div class="pt-3 border-t border-surface-100 dark:border-surface-800 flex items-center justify-between">
            <div class="flex items-center gap-1 text-amber-500 font-bold text-sm">
              <span class="text-base">🪙</span>
              <span>+${req.rewardPoints} pts</span>
            </div>
            $actionButtonHtml
          </div>
        </div>
      </div>
    ''';
  }

  void _bindCardActionButtons() {
    final shareBtns = web.document.querySelectorAll('.share-btn');
    for (var i = 0; i < shareBtns.length; i++) {
      final btn = shareBtns.item(i) as web.HTMLElement?;
      btn?.addEventListener('click', ((web.Event e) {
        final code = btn.getAttribute('data-code') ?? 'HH-FAVOR';
        web.window.alert('Favor share code copied: $code 🔗');
      }).toJS);
    }

    final bookmarkBtns = web.document.querySelectorAll('.bookmark-btn');
    for (var i = 0; i < bookmarkBtns.length; i++) {
      final btn = bookmarkBtns.item(i) as web.HTMLElement?;
      btn?.addEventListener(
        'click',
        ((web.Event e) {
          final idStr = btn.getAttribute('data-id');
          if (idStr != null) {
            final id = int.tryParse(idStr);
            if (id != null) {
              final userEmailEl = web.document.querySelector('#user-email');
              final email = userEmailEl?.textContent ?? 'user@helphub.com';

              client.helpRequest.bookmarkHelpRequest(requestId: id, userEmail: email).then((isAdded) {
                web.window.alert(isAdded ? 'Favor saved to bookmarks! 🔖' : 'Removed from bookmarks.');
                loadHelpRequests();
              });
            }
          }
        }).toJS,
      );
    }

    final chatBtns = web.document.querySelectorAll('.direct-chat-btn');
    for (var i = 0; i < chatBtns.length; i++) {
      final btn = chatBtns.item(i) as web.HTMLElement?;
      btn?.addEventListener(
        'click',
        ((web.Event e) {
          final idStr = btn.getAttribute('data-id');
          if (idStr != null) {
            final id = int.tryParse(idStr);
            if (id != null) {
              _openChatModal(id);
            }
          }
        }).toJS,
      );
    }

    final proofBtns = web.document.querySelectorAll('.complete-proof-btn');
    for (var i = 0; i < proofBtns.length; i++) {
      final btn = proofBtns.item(i) as web.HTMLElement?;
      btn?.addEventListener(
        'click',
        ((web.Event e) {
          final idStr = btn.getAttribute('data-id');
          if (idStr != null) {
            final id = int.tryParse(idStr);
            if (id != null) {
              activeProofRequestId = id;
              _toggleModal('proof-modal', show: true);
            }
          }
        }).toJS,
      );
    }

    final upvoteBtns = web.document.querySelectorAll('.upvote-btn');
    for (var i = 0; i < upvoteBtns.length; i++) {
      final btn = upvoteBtns.item(i) as web.HTMLElement?;
      btn?.addEventListener(
        'click',
        ((web.Event e) {
          final idStr = btn.getAttribute('data-id');
          if (idStr != null) {
            final id = int.tryParse(idStr);
            if (id != null) {
              client.helpRequest.upvoteHelpRequest(requestId: id).then((_) {
                loadHelpRequests();
              });
            }
          }
        }).toJS,
      );
    }

    final cancelReqBtns = web.document.querySelectorAll('.cancel-req-btn');
    for (var i = 0; i < cancelReqBtns.length; i++) {
      final btn = cancelReqBtns.item(i) as web.HTMLElement?;
      btn?.addEventListener(
        'click',
        ((web.Event e) {
          final idStr = btn.getAttribute('data-id');
          if (idStr != null) {
            final id = int.tryParse(idStr);
            if (id != null) {
              client.helpRequest.cancelHelpRequest(requestId: id).then((_) {
                loadHelpRequests();
                loadCommunityStats();
                loadNotifications();
              });
            }
          }
        }).toJS,
      );
    }

    final boostBtns = web.document.querySelectorAll('.boost-btn');
    for (var i = 0; i < boostBtns.length; i++) {
      final btn = boostBtns.item(i) as web.HTMLElement?;
      btn?.addEventListener(
        'click',
        ((web.Event e) {
          final idStr = btn.getAttribute('data-id');
          if (idStr != null) {
            final id = int.tryParse(idStr);
            if (id != null) {
              client.helpRequest.boostRewardPoints(requestId: id, boostAmount: 10).then((_) {
                loadHelpRequests();
                loadNotifications();
              });
            }
          }
        }).toJS,
      );
    }

    final claimBtns = web.document.querySelectorAll('.claim-btn');
    for (var i = 0; i < claimBtns.length; i++) {
      final btn = claimBtns.item(i) as web.HTMLElement?;
      btn?.addEventListener(
        'click',
        ((web.Event e) {
          final idStr = btn.getAttribute('data-id');
          if (idStr != null) {
            final id = int.tryParse(idStr);
            if (id != null) {
              final emailEl = web.document.querySelector('#user-email');
              final email = emailEl?.textContent ?? 'helper@helphub.com';

              client.helpRequest
                  .claimHelpRequest(requestId: id, helperEmail: email)
                  .then((_) {
                    loadHelpRequests();
                    loadUserProfile();
                    loadLeaderboard();
                    loadCommunityStats();
                    loadNotifications();
                    loadActivityStream();
                  });
            }
          }
        }).toJS,
      );
    }

    final rateBtns = web.document.querySelectorAll('.rate-btn');
    for (var i = 0; i < rateBtns.length; i++) {
      final btn = rateBtns.item(i) as web.HTMLElement?;
      btn?.addEventListener(
        'click',
        ((web.Event e) {
          final idStr = btn.getAttribute('data-id');
          final helperIdStr = btn.getAttribute('data-helper-id');
          if (idStr != null && helperIdStr != null) {
            activeRatingRequestId = int.tryParse(idStr);
            activeRatingToUserId = int.tryParse(helperIdStr);
            _toggleModal('rating-modal', show: true);
          }
        }).toJS,
      );
    }

    final tipBtns = web.document.querySelectorAll('.tip-btn');
    for (var i = 0; i < tipBtns.length; i++) {
      final btn = tipBtns.item(i) as web.HTMLElement?;
      btn?.addEventListener(
        'click',
        ((web.Event e) {
          final helperIdStr = btn.getAttribute('data-helper-id');
          if (helperIdStr != null) {
            final helperId = int.tryParse(helperIdStr);
            if (helperId != null) {
              client.helpRequest
                  .tipHelper(helperUserId: helperId, tipAmount: 15)
                  .then((_) {
                    web.window.alert(
                      'Tipped 15 bonus points to the helper! 🎁',
                    );
                    loadLeaderboard();
                    loadNotifications();
                  });
            }
          }
        }).toJS,
      );
    }

    final commentsBtns = web.document.querySelectorAll('.comments-btn');
    for (var i = 0; i < commentsBtns.length; i++) {
      final btn = commentsBtns.item(i) as web.HTMLElement?;
      btn?.addEventListener(
        'click',
        ((web.Event e) {
          final idStr = btn.getAttribute('data-id');
          if (idStr != null) {
            final id = int.tryParse(idStr);
            if (id != null) {
              activeCommentsRequestId = id;
              _openCommentsModal(id);
            }
          }
        }).toJS,
      );
    }
  }

  Future<void> _submitRating() async {
    if (activeRatingRequestId == null || activeRatingToUserId == null) return;

    final selectEl = web.document.querySelector('#rating-score-select') as web.HTMLSelectElement?;
    final feedbackEl = web.document.querySelector('#rating-feedback-input') as web.HTMLTextAreaElement?;

    final rating = int.tryParse(selectEl?.value ?? '5') ?? 5;
    final feedback = feedbackEl?.value.trim();

    try {
      await client.helpRequest.submitRating(
        requestId: activeRatingRequestId!,
        toUserId: activeRatingToUserId!,
        rating: rating,
        feedback: feedback,
      );

      web.window.alert('Thank you! Rating submitted successfully. ⭐');
      _toggleModal('rating-modal', show: false);
      await loadUserProfile();
      await loadLeaderboard();
    } catch (e) {
      web.window.alert('Failed to submit rating.');
    }
  }

  Future<void> _openCommentsModal(int requestId) async {
    _toggleModal('comments-modal', show: true);
    await _loadCommentsList(requestId);
  }

  Future<void> _loadCommentsList(int requestId) async {
    final listEl = web.document.querySelector('#comments-list-container');
    if (listEl == null) return;

    try {
      final comments = await client.helpRequest.getComments(
        requestId: requestId,
      );
      listEl.textContent = '';

      if (comments.isEmpty) {
        listEl.insertAdjacentHTML(
          'beforeend',
          '<p class="text-xs text-surface-400 text-center py-4">No comments yet. Be the first to start the discussion!</p>'.toJS,
        );
        return;
      }

      for (final c in comments) {
        final commentHtml =
            '''
          <div class="p-2.5 rounded-xl bg-surface-50 dark:bg-surface-800 border border-surface-200/60 dark:border-surface-700/60">
            <div class="flex items-center justify-between mb-1">
              <span class="text-xs font-bold text-indigo-600 dark:text-indigo-400">${_escapeHtml(c.authorEmail)}</span>
              <span class="text-[10px] text-surface-400">Just now</span>
            </div>
            <p class="text-xs text-surface-700 dark:text-surface-200">${_escapeHtml(c.content)}</p>
          </div>
        ''';
        listEl.insertAdjacentHTML('beforeend', commentHtml.toJS);
      }
    } catch (e) {
      // Ignore
    }
  }

  Future<void> _submitComment() async {
    if (activeCommentsRequestId == null) return;

    final inputEl =
        web.document.querySelector('#comment-input') as web.HTMLInputElement?;
    final content = inputEl?.value.trim() ?? '';
    if (content.isEmpty) return;

    final userEmailEl = web.document.querySelector('#user-email');
    final authorEmail = userEmailEl?.textContent ?? 'neighbor@helphub.com';

    try {
      await client.helpRequest.addComment(
        requestId: activeCommentsRequestId!,
        content: content,
        authorEmail: authorEmail,
      );

      if (inputEl != null) inputEl.value = '';
      await _loadCommentsList(activeCommentsRequestId!);
      await loadNotifications();
      await loadActivityStream();
    } catch (e) {
      web.window.alert('Failed to post comment.');
    }
  }

  Future<void> _submitNewRequest() async {
    final titleEl =
        web.document.querySelector('#req-title') as web.HTMLInputElement?;
    final catEl =
        web.document.querySelector('#req-category') as web.HTMLSelectElement?;
    final urgEl =
        web.document.querySelector('#req-urgency') as web.HTMLSelectElement?;
    final zoneEl =
        web.document.querySelector('#req-zone') as web.HTMLSelectElement?;
    final durEl =
        web.document.querySelector('#req-duration') as web.HTMLSelectElement?;
    final locEl =
        web.document.querySelector('#req-location') as web.HTMLInputElement?;
    final ptsEl =
        web.document.querySelector('#req-points') as web.HTMLInputElement?;
    final descEl = web.document.querySelector(
      '#req-description',
    ) as web.HTMLTextAreaElement?;

    final title = titleEl?.value.trim() ?? '';
    final category = catEl?.value ?? 'Borrow Item';
    final urgency = urgEl?.value ?? 'Normal';
    final zone = zoneEl?.value ?? 'North Campus';
    final duration = durEl?.value ?? '15-30 mins';
    final location = locEl?.value.trim() ?? '';
    final points = int.tryParse(ptsEl?.value ?? '25') ?? 25;
    final description = descEl?.value.trim() ?? '';

    if (title.isEmpty || location.isEmpty || description.isEmpty) {
      web.window.alert('Please fill out title, location, and description.');
      return;
    }

    final userEmailEl = web.document.querySelector('#user-email');
    final creatorEmail = userEmailEl?.textContent ?? 'user@helphub.com';

    try {
      await client.helpRequest.createHelpRequest(
        title: title,
        description: description,
        category: category,
        location: location,
        urgency: urgency,
        rewardPoints: points,
        isEmergency: urgency == 'Urgent',
        creatorEmail: creatorEmail,
        neighborhoodZone: zone,
        estimatedDuration: duration,
      );

      // Clear fields
      if (titleEl != null) titleEl.value = '';
      if (locEl != null) locEl.value = '';
      if (descEl != null) descEl.value = '';

      _toggleModal('create-modal', show: false);
      await loadHelpRequests();
      await loadUserProfile();
      await loadLeaderboard();
      await loadCommunityStats();
      await loadNotifications();
      await loadActivityStream();
    } catch (e) {
      web.window.alert('Failed to publish request. Please try again.');
    }
  }

  void _toggleModal(String modalId, {required bool show}) {
    final modal = web.document.querySelector('#$modalId');
    if (modal != null) {
      if (show) {
        modal.classList.remove('hidden');
      } else {
        modal.classList.add('hidden');
      }
    }
  }

  String _escapeHtml(String input) {
    return input
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#39;');
  }
}
