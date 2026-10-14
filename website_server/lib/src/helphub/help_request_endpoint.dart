import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class HelpRequestEndpoint extends Endpoint {
  /// Sends a direct chat message for a claimed favor request.
  Future<FavorChatMessage> sendChatMessage(
    Session session, {
    required int requestId,
    required String message,
    required String senderEmail,
  }) async {
    final authInfo = session.authenticated;
    final userId = authInfo != null
        ? (int.tryParse(authInfo.userIdentifier) ??
              authInfo.userIdentifier.hashCode)
        : (senderEmail.isNotEmpty ? senderEmail.hashCode : 1);

    final chat = FavorChatMessage(
      requestId: requestId,
      senderUserId: userId,
      senderEmail: senderEmail.isNotEmpty
          ? senderEmail
          : 'neighbor@helphub.com',
      message: message,
      createdAt: DateTime.now().toUtc(),
    );

    final inserted = await FavorChatMessage.db.insertRow(session, chat);

    final request = await HelpRequest.db.findById(session, requestId);
    if (request != null) {
      final recipient = request.creatorEmail == senderEmail
          ? (request.helperEmail ?? 'helper@helphub.com')
          : request.creatorEmail;

      await _createNotification(
        session,
        recipientEmail: recipient,
        title: '💬 Direct Message on Favor',
        message: '$senderEmail: "$message"',
        requestId: requestId,
      );
    }

    return inserted;
  }

  /// Gets chat messages for a favor request.
  Future<List<FavorChatMessage>> getChatMessages(
    Session session, {
    required int requestId,
  }) async {
    final messages = await FavorChatMessage.db.find(
      session,
      where: (t) => t.requestId.equals(requestId),
      orderBy: (t) => t.createdAt,
    );
    return messages;
  }

  /// Completes a help request with an optional completion proof note.
  Future<HelpRequest> completeHelpRequestWithProof(
    Session session, {
    required int requestId,
    String? proofNote,
  }) async {
    final request = await HelpRequest.db.findById(session, requestId);
    if (request == null) {
      throw Exception('Help request not found');
    }

    if (request.status == 'Completed') {
      return request;
    }

    final updated = request.copyWith(
      status: 'Completed',
      completionProofNote: proofNote ?? 'Favor completed successfully.',
      updatedAt: DateTime.now().toUtc(),
    );

    final saved = await HelpRequest.db.updateRow(session, updated);

    if (saved.helperUserId != null) {
      final helperEmail = saved.helperEmail ?? 'helper@helphub.com';
      await _addRewardPointsAndCompletedCount(
        session,
        saved.helperUserId!,
        helperEmail,
        saved.rewardPoints,
      );

      await _createNotification(
        session,
        recipientEmail: helperEmail,
        title: '🎉 Favor Completed & Rewarded!',
        message:
            'You earned +${saved.rewardPoints} pts for completing "${saved.title}"!',
        requestId: saved.id,
      );
    }

    return saved;
  }

  /// Fetches community overall stats summary.
  Future<Map<String, int>> getCommunityStats(Session session) async {
    final allRequests = await HelpRequest.db.find(session);

    int openCount = 0;
    int inProgressCount = 0;
    int completedCount = 0;
    int totalPointsAwarded = 0;

    for (final req in allRequests) {
      if (req.status == 'Open') openCount++;
      if (req.status == 'In Progress') inProgressCount++;
      if (req.status == 'Completed') {
        completedCount++;
        totalPointsAwarded += req.rewardPoints;
      }
    }

    return {
      'totalRequests': allRequests.length,
      'openCount': openCount,
      'inProgressCount': inProgressCount,
      'completedCount': completedCount,
      'totalPointsAwarded': totalPointsAwarded,
    };
  }

  /// Broadcasts an urgent high-priority emergency SOS request to the community.
  Future<HelpRequest> broadcastEmergencySOS(
    Session session, {
    required String title,
    required String description,
    required String location,
    required String creatorEmail,
    String? neighborhoodZone,
  }) async {
    final authInfo = session.authenticated;
    final userId = authInfo != null
        ? (int.tryParse(authInfo.userIdentifier) ??
              authInfo.userIdentifier.hashCode)
        : (creatorEmail.isNotEmpty ? creatorEmail.hashCode : 1);

    final request = HelpRequest(
      title: '⚡ SOS: $title',
      description: description,
      category: 'Emergency',
      location: location,
      urgency: 'Urgent',
      status: 'Open',
      rewardPoints: 50,
      isEmergency: true,
      creatorUserId: userId,
      creatorEmail: creatorEmail.isNotEmpty ? creatorEmail : 'sos@helphub.com',
      neighborhoodZone: neighborhoodZone ?? 'North Campus',
      estimatedDuration: 'Immediate',
      upvotes: 5,
      createdAt: DateTime.now().toUtc(),
    );

    final inserted = await HelpRequest.db.insertRow(session, request);
    await _incrementRequestedCount(session, userId, creatorEmail);

    final profiles = await UserProfile.db.find(session);
    for (final p in profiles.take(10)) {
      if (p.email != creatorEmail) {
        await _createNotification(
          session,
          recipientEmail: p.email,
          title: '🚨 Emergency SOS Alert!',
          message: 'Urgent request nearby: "$title" at $location.',
          requestId: inserted.id,
        );
      }
    }

    return inserted;
  }

  /// Fetches all help requests, optionally filtered by category, status, zone, emergency mode, search query, or activity filter.
  Future<List<HelpRequest>> getHelpRequests(
    Session session, {
    String? category,
    String? status,
    String? neighborhoodZone,
    bool? isEmergency,
    String? searchQuery,
    String? sortBy,
    String? myEmailFilter,
    String? myActivityMode, // 'posted', 'claimed'
  }) async {
    Expression where = Constant.bool(true);

    if (category != null && category.isNotEmpty && category != 'All') {
      where = where & HelpRequest.t.category.equals(category);
    }

    if (status != null && status.isNotEmpty && status != 'All') {
      where = where & HelpRequest.t.status.equals(status);
    }

    if (neighborhoodZone != null &&
        neighborhoodZone.isNotEmpty &&
        neighborhoodZone != 'All') {
      where = where & HelpRequest.t.neighborhoodZone.equals(neighborhoodZone);
    }

    if (isEmergency == true) {
      where = where & HelpRequest.t.isEmergency.equals(true);
    }

    if (myEmailFilter != null && myEmailFilter.isNotEmpty) {
      if (myActivityMode == 'posted') {
        where = where & HelpRequest.t.creatorEmail.equals(myEmailFilter);
      } else if (myActivityMode == 'claimed') {
        where = where & HelpRequest.t.helperEmail.equals(myEmailFilter);
      }
    }

    var requests = await HelpRequest.db.find(
      session,
      where: (t) => where,
      orderBy: (t) => t.createdAt,
    );

    if (searchQuery != null && searchQuery.trim().isNotEmpty) {
      final q = searchQuery.trim().toLowerCase();
      requests = requests.where((r) {
        return r.title.toLowerCase().contains(q) ||
            r.description.toLowerCase().contains(q) ||
            r.location.toLowerCase().contains(q);
      }).toList();
    }

    // Sorting logic
    if (sortBy == 'reward') {
      requests.sort((a, b) => b.rewardPoints.compareTo(a.rewardPoints));
    } else if (sortBy == 'urgency') {
      int getUrgencyRank(String urgency) {
        if (urgency == 'Urgent') return 3;
        if (urgency == 'Normal') return 2;
        return 1;
      }

      requests.sort(
        (a, b) =>
            getUrgencyRank(b.urgency).compareTo(getUrgencyRank(a.urgency)),
      );
    } else if (sortBy == 'upvotes') {
      requests.sort((a, b) => (b.upvotes ?? 0).compareTo(a.upvotes ?? 0));
    } else {
      // Default: newest first
      requests.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }

    return requests;
  }

  /// Creates a new help request.
  Future<HelpRequest> createHelpRequest(
    Session session, {
    required String title,
    required String description,
    required String category,
    required String location,
    required String urgency,
    required int rewardPoints,
    bool? isEmergency,
    required String creatorEmail,
    String? neighborhoodZone,
    String? estimatedDuration,
  }) async {
    final authInfo = session.authenticated;
    final userId = authInfo != null
        ? (int.tryParse(authInfo.userIdentifier) ??
              authInfo.userIdentifier.hashCode)
        : (creatorEmail.isNotEmpty ? creatorEmail.hashCode : 1);

    final request = HelpRequest(
      title: title,
      description: description,
      category: category,
      location: location,
      urgency: urgency,
      status: 'Open',
      rewardPoints: rewardPoints,
      isEmergency: isEmergency ?? (urgency == 'Urgent'),
      creatorUserId: userId,
      creatorEmail: creatorEmail.isNotEmpty
          ? creatorEmail
          : 'anonymous@helphub.com',
      neighborhoodZone: neighborhoodZone ?? 'North Campus',
      estimatedDuration: estimatedDuration ?? '15-30 mins',
      upvotes: 0,
      createdAt: DateTime.now().toUtc(),
    );

    final inserted = await HelpRequest.db.insertRow(session, request);
    await _incrementRequestedCount(session, userId, creatorEmail);

    return inserted;
  }

  /// Upvotes a help request.
  Future<HelpRequest> upvoteHelpRequest(
    Session session, {
    required int requestId,
  }) async {
    final request = await HelpRequest.db.findById(session, requestId);
    if (request == null) {
      throw Exception('Help request not found');
    }

    final currentUpvotes = request.upvotes ?? 0;
    final updated = request.copyWith(
      upvotes: currentUpvotes + 1,
      updatedAt: DateTime.now().toUtc(),
    );

    return await HelpRequest.db.updateRow(session, updated);
  }

  /// Cancels an open or in-progress help request.
  Future<HelpRequest> cancelHelpRequest(
    Session session, {
    required int requestId,
  }) async {
    final request = await HelpRequest.db.findById(session, requestId);
    if (request == null) {
      throw Exception('Help request not found');
    }

    final updated = request.copyWith(
      status: 'Cancelled',
      updatedAt: DateTime.now().toUtc(),
    );

    final saved = await HelpRequest.db.updateRow(session, updated);

    await _createNotification(
      session,
      recipientEmail: saved.creatorEmail,
      title: '🚫 Request Cancelled',
      message: 'Your help request "${saved.title}" was cancelled.',
      requestId: saved.id,
    );

    return saved;
  }

  /// Boosts reward points for an open request.
  Future<HelpRequest> boostRewardPoints(
    Session session, {
    required int requestId,
    required int boostAmount,
  }) async {
    final request = await HelpRequest.db.findById(session, requestId);
    if (request == null) {
      throw Exception('Help request not found');
    }

    final updated = request.copyWith(
      rewardPoints: request.rewardPoints + boostAmount,
      updatedAt: DateTime.now().toUtc(),
    );

    final saved = await HelpRequest.db.updateRow(session, updated);

    await _createNotification(
      session,
      recipientEmail: saved.creatorEmail,
      title: '🪙 Favor Reward Boosted!',
      message:
          'Your request "${saved.title}" reward was boosted by +$boostAmount pts!',
      requestId: saved.id,
    );

    return saved;
  }

  /// Claim a help request as a helper.
  Future<HelpRequest> claimHelpRequest(
    Session session, {
    required int requestId,
    required String helperEmail,
  }) async {
    final authInfo = session.authenticated;
    final userId = authInfo != null
        ? (int.tryParse(authInfo.userIdentifier) ??
              authInfo.userIdentifier.hashCode)
        : (helperEmail.isNotEmpty ? helperEmail.hashCode : 2);

    final request = await HelpRequest.db.findById(session, requestId);
    if (request == null) {
      throw Exception('Help request not found');
    }

    if (request.status != 'Open') {
      throw Exception('This request is no longer open');
    }

    final updated = request.copyWith(
      status: 'In Progress',
      helperUserId: userId,
      helperEmail: helperEmail.isNotEmpty ? helperEmail : 'helper@helphub.com',
      updatedAt: DateTime.now().toUtc(),
    );

    final saved = await HelpRequest.db.updateRow(session, updated);

    await _createNotification(
      session,
      recipientEmail: saved.creatorEmail,
      title: '🤝 Favor Claimed!',
      message:
          '${saved.helperEmail} has claimed your request "${saved.title}".',
      requestId: saved.id,
    );

    return saved;
  }

  /// Mark a help request as completed.
  Future<HelpRequest> completeHelpRequest(
    Session session, {
    required int requestId,
  }) async {
    return completeHelpRequestWithProof(
      session,
      requestId: requestId,
      proofNote: 'Favor completed successfully.',
    );
  }

  /// Tips additional bonus points to a helper for exceptional help.
  Future<bool> tipHelper(
    Session session, {
    required int helperUserId,
    required int tipAmount,
  }) async {
    if (tipAmount <= 0) return false;

    var profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(helperUserId),
    );

    if (profile != null) {
      final updated = profile.copyWith(
        points: profile.points + tipAmount,
      );
      await UserProfile.db.updateRow(session, updated);

      await _createNotification(
        session,
        recipientEmail: profile.email,
        title: '🎁 Bonus Tip Received!',
        message: 'You received a $tipAmount pts tip for your awesome help!',
      );

      return true;
    }
    return false;
  }

  /// Get user profile stats for Helphub
  Future<UserProfile> getUserProfile(
    Session session, {
    required String email,
  }) async {
    final authInfo = session.authenticated;
    final userId = authInfo != null
        ? (int.tryParse(authInfo.userIdentifier) ??
              authInfo.userIdentifier.hashCode)
        : (email.isNotEmpty ? email.hashCode : 1);

    final userEmail = email.isNotEmpty ? email : 'guest@helphub.com';
    final name = userEmail.contains('@')
        ? userEmail.split('@').first
        : userEmail;

    var profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (profile == null) {
      profile = UserProfile(
        userId: userId,
        email: userEmail,
        displayName: name,
        points: 50,
        completedCount: 0,
        requestedCount: 0,
        avatarBadge: '🌱 Community Rookie',
        ratingAverage: 5.0,
        ratingCount: 1,
        skills: 'General, Errands, Tutoring',
      );
      profile = await UserProfile.db.insertRow(session, profile);
    }

    return profile;
  }

  /// Updates user profile display name and skills tags.
  Future<UserProfile> updateUserProfile(
    Session session, {
    required String email,
    required String displayName,
    required String skills,
  }) async {
    var profile = await getUserProfile(session, email: email);
    final updated = profile.copyWith(
      displayName: displayName.isNotEmpty ? displayName : profile.displayName,
      skills: skills,
    );

    return await UserProfile.db.updateRow(session, updated);
  }

  /// Adds a comment to a request.
  Future<RequestComment> addComment(
    Session session, {
    required int requestId,
    required String content,
    required String authorEmail,
  }) async {
    final authInfo = session.authenticated;
    final userId = authInfo != null
        ? (int.tryParse(authInfo.userIdentifier) ??
              authInfo.userIdentifier.hashCode)
        : (authorEmail.isNotEmpty ? authorEmail.hashCode : 1);

    final comment = RequestComment(
      requestId: requestId,
      authorUserId: userId,
      authorEmail: authorEmail.isNotEmpty
          ? authorEmail
          : 'neighbor@helphub.com',
      content: content,
      createdAt: DateTime.now().toUtc(),
    );

    final inserted = await RequestComment.db.insertRow(session, comment);

    final request = await HelpRequest.db.findById(session, requestId);
    if (request != null && request.creatorEmail != authorEmail) {
      await _createNotification(
        session,
        recipientEmail: request.creatorEmail,
        title: '💬 New Comment on Request',
        message: '$authorEmail commented: "$content"',
        requestId: requestId,
      );
    }

    return inserted;
  }

  /// Gets comments for a specific request.
  Future<List<RequestComment>> getComments(
    Session session, {
    required int requestId,
  }) async {
    final comments = await RequestComment.db.find(
      session,
      where: (t) => t.requestId.equals(requestId),
      orderBy: (t) => t.createdAt,
    );
    return comments;
  }

  /// Submits rating and feedback for a completed request.
  Future<RequestRating> submitRating(
    Session session, {
    required int requestId,
    required int toUserId,
    required int rating,
    String? feedback,
  }) async {
    final authInfo = session.authenticated;
    final fromUserId = authInfo != null
        ? (int.tryParse(authInfo.userIdentifier) ??
              authInfo.userIdentifier.hashCode)
        : 1;

    final requestRating = RequestRating(
      requestId: requestId,
      fromUserId: fromUserId,
      toUserId: toUserId,
      rating: rating,
      feedback: feedback,
      createdAt: DateTime.now().toUtc(),
    );

    final saved = await RequestRating.db.insertRow(session, requestRating);

    var targetProfile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(toUserId),
    );

    if (targetProfile != null) {
      final currentCount = targetProfile.ratingCount ?? 0;
      final currentAvg = targetProfile.ratingAverage ?? 5.0;
      final newCount = currentCount + 1;
      final newAvg = ((currentAvg * currentCount) + rating) / newCount;

      final updatedProfile = targetProfile.copyWith(
        ratingAverage: double.parse(newAvg.toStringAsFixed(1)),
        ratingCount: newCount,
      );
      await UserProfile.db.updateRow(session, updatedProfile);

      await _createNotification(
        session,
        recipientEmail: targetProfile.email,
        title: '⭐ New Rating Received!',
        message: 'You received a $rating-star rating for favor #$requestId!',
        requestId: requestId,
      );
    }

    return saved;
  }

  /// Gets rating list for a user.
  Future<List<RequestRating>> getHelperRatings(
    Session session, {
    required int toUserId,
  }) async {
    final ratings = await RequestRating.db.find(
      session,
      where: (t) => t.toUserId.equals(toUserId),
      orderBy: (t) => t.createdAt,
    );
    return ratings;
  }

  /// Get notifications for a user
  Future<List<UserNotification>> getUserNotifications(
    Session session, {
    required String userEmail,
  }) async {
    final notifications = await UserNotification.db.find(
      session,
      where: (t) => t.recipientEmail.equals(userEmail),
      orderBy: (t) => t.createdAt,
    );

    if (notifications.isEmpty) {
      final welcomeNotif = UserNotification(
        recipientEmail: userEmail,
        title: '👋 Welcome to HelpHub!',
        message:
            'Start by browsing neighbor requests or posting your first favor.',
        isRead: false,
        createdAt: DateTime.now().toUtc(),
      );
      final inserted = await UserNotification.db.insertRow(
        session,
        welcomeNotif,
      );
      return [inserted];
    }

    notifications.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return notifications;
  }

  /// Marks notification as read
  Future<bool> markNotificationRead(
    Session session, {
    required int notificationId,
  }) async {
    final notif = await UserNotification.db.findById(session, notificationId);
    if (notif != null) {
      final updated = notif.copyWith(isRead: true);
      await UserNotification.db.updateRow(session, updated);
      return true;
    }
    return false;
  }

  /// Fetches top community helpers leaderboard.
  Future<List<UserProfile>> getLeaderboard(Session session) async {
    var profiles = await UserProfile.db.find(session);
    profiles.sort((a, b) => b.points.compareTo(a.points));
    return profiles.take(10).toList();
  }

  /// Fetches community announcements.
  Future<List<CommunityAnnouncement>> getAnnouncements(Session session) async {
    var announcements = await CommunityAnnouncement.db.find(
      session,
      orderBy: (t) => t.createdAt,
    );

    if (announcements.isEmpty) {
      final defaultAnn = CommunityAnnouncement(
        title: 'Welcome to HelpHub Community Network!',
        content:
            'Connect with neighbors and fellow students to exchange favors, lend items, and build a stronger local community.',
        category: '📢 System Announcement',
        authorEmail: 'admin@helphub.com',
        isPinned: true,
        createdAt: DateTime.now().toUtc(),
      );
      final inserted = await CommunityAnnouncement.db.insertRow(
        session,
        defaultAnn,
      );
      return [inserted];
    }

    announcements.sort((a, b) {
      if (a.isPinned && !b.isPinned) return -1;
      if (!a.isPinned && b.isPinned) return 1;
      return b.createdAt.compareTo(a.createdAt);
    });

    return announcements;
  }

  /// Creates a new community announcement.
  Future<CommunityAnnouncement> createAnnouncement(
    Session session, {
    required String title,
    required String content,
    required String category,
    required String authorEmail,
    bool? isPinned,
  }) async {
    final announcement = CommunityAnnouncement(
      title: title,
      content: content,
      category: category,
      authorEmail: authorEmail,
      isPinned: isPinned ?? false,
      createdAt: DateTime.now().toUtc(),
    );

    return await CommunityAnnouncement.db.insertRow(session, announcement);
  }

  Future<void> _createNotification(
    Session session, {
    required String recipientEmail,
    required String title,
    required String message,
    int? requestId,
  }) async {
    final notif = UserNotification(
      recipientEmail: recipientEmail,
      title: title,
      message: message,
      requestId: requestId,
      isRead: false,
      createdAt: DateTime.now().toUtc(),
    );

    await UserNotification.db.insertRow(session, notif);
  }

  Future<void> _incrementRequestedCount(
    Session session,
    int userId,
    String email,
  ) async {
    var profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    if (profile == null) {
      profile = UserProfile(
        userId: userId,
        email: email,
        displayName: email.contains('@') ? email.split('@').first : 'User',
        points: 50,
        completedCount: 0,
        requestedCount: 1,
        avatarBadge: '🌱 Community Rookie',
        ratingAverage: 5.0,
        ratingCount: 1,
        skills: 'General, Errands',
      );
      await UserProfile.db.insertRow(session, profile);
    } else {
      final updated = profile.copyWith(
        requestedCount: profile.requestedCount + 1,
      );
      await UserProfile.db.updateRow(session, updated);
    }
  }

  Future<void> _addRewardPointsAndCompletedCount(
    Session session,
    int userId,
    String email,
    int points,
  ) async {
    var profile = await UserProfile.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId),
    );

    final newPoints = (profile?.points ?? 50) + points;
    final newCompleted = (profile?.completedCount ?? 0) + 1;
    String badge = '🌱 Community Rookie';
    if (newCompleted >= 10) {
      badge = '⚡ Community Hero';
    } else if (newCompleted >= 5) {
      badge = '🌟 Super Helper';
    } else if (newCompleted >= 1) {
      badge = '🤝 Active Neighbor';
    }

    if (profile == null) {
      profile = UserProfile(
        userId: userId,
        email: email,
        displayName: email.contains('@') ? email.split('@').first : 'Helper',
        points: newPoints,
        completedCount: newCompleted,
        requestedCount: 0,
        avatarBadge: badge,
        ratingAverage: 5.0,
        ratingCount: 1,
        skills: 'General, Tutoring',
      );
      await UserProfile.db.insertRow(session, profile);
    } else {
      final updated = profile.copyWith(
        points: newPoints,
        completedCount: newCompleted,
        avatarBadge: badge,
      );
      await UserProfile.db.updateRow(session, updated);
    }
  }
}
