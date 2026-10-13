import 'dart:js_interop';

import 'package:web/web.dart' as web;
import 'package:website_client/website_client.dart' as wc;

/// Extension to invoke insertAdjacentHTML safely on Element using web.Element.
extension ElementInsertExtension on web.Element {
  void insertHtml(String position, String text) {
    insertAdjacentHTML(position, text.toJS);
  }
}

/// Manages interactive logic for HelpHub in the webpage frontend.
class HelpHubController {
  final wc.Client client;

  String currentCategory = 'All';
  String currentStatus = 'All';
  String currentSearch = '';
  bool emergencyOnly = false;

  int? activeCommentsRequestId;

  HelpHubController(this.client);

  void init() {
    _bindEvents();
    loadUserProfile();
    loadLeaderboard();
    loadHelpRequests();
  }

  void _bindEvents() {
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
      ((web.Event e) async {
        e.preventDefault();
        await _submitComment();
      }).toJS,
    );

    // Submit create request
    final submitBtn = web.document.querySelector('#submit-create-btn');
    submitBtn?.addEventListener(
      'click',
      ((web.Event e) async {
        e.preventDefault();
        await _submitNewRequest();
      }).toJS,
    );

    // Filters
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

    final statusSelect =
        web.document.querySelector('#status-filter') as web.HTMLSelectElement?;
    statusSelect?.addEventListener(
      'change',
      ((web.Event e) {
        currentStatus = statusSelect.value;
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

      // Update milestone progress bar
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

  Future<void> loadLeaderboard() async {
    final container = web.document.querySelector('#leaderboard-container');
    if (container == null) return;

    try {
      final topUsers = await client.helpRequest.getLeaderboard();
      container.textContent = '';

      if (topUsers.isEmpty) {
        container.insertHtml(
          'beforeend',
          '<p class="text-xs text-surface-400 col-span-full">No leaderboard entries yet.</p>',
        );
        return;
      }

      for (var i = 0; i < topUsers.length; i++) {
        final u = topUsers[i];
        final rank = '#${i + 1}';
        final cardHtml =
            '''
          <div class="p-3 rounded-xl bg-white dark:bg-surface-900 border border-surface-200 dark:border-surface-800 flex items-center gap-3 shadow-sm">
            <span class="text-base font-black text-amber-500">$rank</span>
            <div class="flex-1">
              <h4 class="text-sm font-bold text-surface-900 dark:text-white">${_escapeHtml(u.displayName)}</h4>
              <p class="text-xs text-indigo-600 dark:text-indigo-400 font-medium">${_escapeHtml(u.avatarBadge)}</p>
            </div>
            <span class="text-xs font-extrabold text-amber-500">${u.points} pts</span>
          </div>
        ''';
        container.insertHtml('beforeend', cardHtml);
      }
    } catch (e) {
      // Ignore
    }
  }

  Future<void> loadHelpRequests() async {
    final container = web.document.querySelector('#requests-container');
    if (container == null) return;

    try {
      final requests = await client.helpRequest.getHelpRequests(
        category: currentCategory,
        status: currentStatus,
        isEmergency: emergencyOnly ? true : null,
        searchQuery: currentSearch,
      );

      container.textContent = '';

      if (requests.isEmpty) {
        container.insertHtml('beforeend', '''
            <div class="col-span-full py-12 text-center text-surface-500 dark:text-surface-400">
              <span class="text-4xl block mb-2">🔍</span>
              <p class="text-base font-semibold">No help requests found.</p>
              <p class="text-xs">Be the first to create one!</p>
            </div>
          ''');
        return;
      }

      for (final req in requests) {
        final cardHtml = _buildCardHtml(req);
        container.insertHtml('beforeend', cardHtml);
      }

      _bindCardActionButtons();
    } catch (e) {
      // Keep static cards on fail
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
    }

    String actionButtonHtml = '';
    if (req.status == 'Open') {
      actionButtonHtml =
          '''
        <button class="claim-btn px-4 py-1.5 text-xs font-semibold rounded-lg text-white bg-indigo-600 hover:bg-indigo-700 transition-colors" data-id="${req.id}">
          Claim Request
        </button>
      ''';
    } else if (req.status == 'In Progress') {
      actionButtonHtml =
          '''
        <button class="complete-btn px-4 py-1.5 text-xs font-semibold rounded-lg text-white bg-emerald-600 hover:bg-emerald-700 transition-colors" data-id="${req.id}">
          Mark Complete
        </button>
      ''';
    } else {
      actionButtonHtml =
          '''
        <div class="flex items-center gap-1.5">
          <button class="tip-btn px-2.5 py-1 text-[11px] font-bold rounded-lg text-amber-600 bg-amber-50 dark:bg-amber-950/50 border border-amber-200 dark:border-amber-800 hover:bg-amber-100 transition-colors" data-helper-id="${req.helperUserId}">
            🎁 Tip Helper
          </button>
          <span class="text-xs font-bold text-emerald-600 dark:text-emerald-400">Done ✓</span>
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
          <p class="text-xs text-surface-500 dark:text-surface-400 mb-2 flex items-center gap-1">
            <span>📍</span> ${_escapeHtml(req.location)}
          </p>
          <p class="text-xs text-surface-400 dark:text-surface-500 mb-3">By: ${_escapeHtml(req.creatorEmail)}</p>
          <p class="text-sm text-surface-600 dark:text-surface-300 line-clamp-3 mb-4">${_escapeHtml(req.description)}</p>
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
    final claimBtns = web.document.querySelectorAll('.claim-btn');
    for (var i = 0; i < claimBtns.length; i++) {
      final btn = claimBtns.item(i) as web.HTMLElement?;
      btn?.addEventListener(
        'click',
        ((web.Event e) async {
          final idStr = btn.getAttribute('data-id');
          if (idStr != null) {
            final id = int.tryParse(idStr);
            if (id != null) {
              final emailEl = web.document.querySelector('#user-email');
              final email = emailEl?.textContent ?? 'helper@helphub.com';

              await client.helpRequest.claimHelpRequest(
                requestId: id,
                helperEmail: email,
              );
              await loadHelpRequests();
              await loadUserProfile();
              await loadLeaderboard();
            }
          }
        }).toJS,
      );
    }

    final completeBtns = web.document.querySelectorAll('.complete-btn');
    for (var i = 0; i < completeBtns.length; i++) {
      final btn = completeBtns.item(i) as web.HTMLElement?;
      btn?.addEventListener(
        'click',
        ((web.Event e) async {
          final idStr = btn.getAttribute('data-id');
          if (idStr != null) {
            final id = int.tryParse(idStr);
            if (id != null) {
              await client.helpRequest.completeHelpRequest(requestId: id);
              await loadHelpRequests();
              await loadUserProfile();
              await loadLeaderboard();
            }
          }
        }).toJS,
      );
    }

    final tipBtns = web.document.querySelectorAll('.tip-btn');
    for (var i = 0; i < tipBtns.length; i++) {
      final btn = tipBtns.item(i) as web.HTMLElement?;
      btn?.addEventListener(
        'click',
        ((web.Event e) async {
          final helperIdStr = btn.getAttribute('data-helper-id');
          if (helperIdStr != null) {
            final helperId = int.tryParse(helperIdStr);
            if (helperId != null) {
              await client.helpRequest.tipHelper(
                helperUserId: helperId,
                tipAmount: 15,
              );
              web.window.alert('Tipped 15 bonus points to the helper! 🎁');
              await loadLeaderboard();
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
        ((web.Event e) async {
          final idStr = btn.getAttribute('data-id');
          if (idStr != null) {
            final id = int.tryParse(idStr);
            if (id != null) {
              activeCommentsRequestId = id;
              await _openCommentsModal(id);
            }
          }
        }).toJS,
      );
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
        listEl.insertHtml(
          'beforeend',
          '<p class="text-xs text-surface-400 text-center py-4">No comments yet. Be the first to start the discussion!</p>',
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
        listEl.insertHtml('beforeend', commentHtml);
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
      );

      // Clear fields
      if (titleEl != null) titleEl.value = '';
      if (locEl != null) locEl.value = '';
      if (descEl != null) descEl.value = '';

      _toggleModal('create-modal', show: false);
      await loadHelpRequests();
      await loadUserProfile();
      await loadLeaderboard();
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
