import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class HelpRequestEndpoint extends Endpoint {
  /// Creates a new Skill/Item Offer.
  Future<SkillOffer> createSkillOffer(
    Session session, {
    required String title,
    required String description,
    required String category,
    required String offererEmail,
    required String availability,
    String? neighborhoodZone,
  }) async {
    final authInfo = session.authenticated;
    final userId = authInfo != null
        ? (int.tryParse(authInfo.userIdentifier) ??
              authInfo.userIdentifier.hashCode)
        : (offererEmail.isNotEmpty ? offererEmail.hashCode : 1);

    final offer = SkillOffer(
      title: title,
      description: description,
      category: category,
      offererUserId: userId,
      offererEmail: offererEmail.isNotEmpty
          ? offererEmail
          : 'neighbor@helphub.com',
      availability: availability,
      neighborhoodZone: neighborhoodZone ?? 'North Campus',
      isAvailable: true,
      createdAt: DateTime.now().toUtc(),
    );

    return await SkillOffer.db.insertRow(session, offer);
  }

  /// Gets all available skill/item offers.
  Future<List<SkillOffer>> getSkillOffers(
    Session session, {
    String? category,
    String? neighborhoodZone,
  }) async {
    var offers = await SkillOffer.db.find(
      session,
      orderBy: (t) => t.createdAt,
    );

    if (category != null && category.isNotEmpty && category != 'All') {
      offers = offers.where((o) => o.category == category).toList();
    }

    if (neighborhoodZone != null &&
        neighborhoodZone.isNotEmpty &&
        neighborhoodZone != 'All') {
      offers = offers
          .where((o) => o.neighborhoodZone == neighborhoodZone)
          .toList();
    }

    if (offers.isEmpty) {
      final sampleOffer = SkillOffer(
        title: '🌱 Free Organic Houseplant Cuttings & Soil',
        description:
            'Happy to share pothos and monstera cuttings plus potting mix with neighbors!',
        category: 'Plant Care',
        offererUserId: 1,
        offererEmail: 'botanist@helphub.com',
        availability: 'Weekends & Evenings',
        neighborhoodZone: 'North Campus',
        isAvailable: true,
        createdAt: DateTime.now().toUtc(),
      );
      final inserted = await SkillOffer.db.insertRow(session, sampleOffer);
      return [inserted];
    }

    offers.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return offers;
  }

  /// Claims or requests an offered skill or item.
  Future<SkillOffer> claimSkillOffer(
    Session session, {
    required int offerId,
    required String claimerEmail,
  }) async {
    final offer = await SkillOffer.db.findById(session, offerId);
    if (offer == null) {
      throw Exception('Skill offer not found');
    }

    final updated = offer.copyWith(
      isAvailable: false,
      claimedByEmail: claimerEmail,
    );

    final saved = await SkillOffer.db.updateRow(session, updated);

    await _createNotification(
      session,
      recipientEmail: saved.offererEmail,
      title: '🎁 Skill/Item Claimed!',
      message: '$claimerEmail requested your offer "${saved.title}".',
    );

    return saved;
  }

  /// Creates a new local community group / circle.
  Future<CommunityGroup> createCommunityGroup(
    Session session, {
    required String name,
    required String description,
    required String category,
    required String neighborhoodZone,
    required String leaderEmail,
  }) async {
    final group = CommunityGroup(
      name: name,
      description: description,
      category: category,
      neighborhoodZone: neighborhoodZone,
      memberCount: 1,
      leaderEmail: leaderEmail.isNotEmpty ? leaderEmail : 'leader@helphub.com',
      membersList: leaderEmail,
      createdAt: DateTime.now().toUtc(),
    );

    return await CommunityGroup.db.insertRow(session, group);
  }

  /// Gets list of local community groups.
  Future<List<CommunityGroup>> getCommunityGroups(Session session) async {
    var groups = await CommunityGroup.db.find(
      session,
      orderBy: (t) => t.createdAt,
    );

    if (groups.isEmpty) {
      final sampleGroup = CommunityGroup(
        name: '🚲 Campus Bike Riders Circle',
        description:
            'Neighborhood cyclists for quick repairs, group rides, and emergency roadside help.',
        category: 'Rides & Gear',
        neighborhoodZone: 'North Campus',
        memberCount: 14,
        leaderEmail: 'cyclist@helphub.com',
        membersList: 'cyclist@helphub.com, rider@helphub.com',
        createdAt: DateTime.now().toUtc(),
      );
      final inserted = await CommunityGroup.db.insertRow(session, sampleGroup);
      return [inserted];
    }

    groups.sort((a, b) => b.memberCount.compareTo(a.memberCount));
    return groups;
  }

  /// Joins a community group.
  Future<CommunityGroup> joinCommunityGroup(
    Session session, {
    required int groupId,
    required String memberEmail,
  }) async {
    final group = await CommunityGroup.db.findById(session, groupId);
    if (group == null) {
      throw Exception('Community group not found');
    }

    final currentMembers = group.membersList ?? '';
    if (currentMembers.contains(memberEmail)) {
      return group;
    }

    final updated = group.copyWith(
      memberCount: group.memberCount + 1,
      membersList: currentMembers.isEmpty
          ? memberEmail
          : '$currentMembers, $memberEmail',
    );

    return await CommunityGroup.db.updateRow(session, updated);
  }

  /// Bookmarks or un-bookmarks a help request for a user.
  Future<bool> bookmarkHelpRequest(
    Session session, {
    required int requestId,
    required String userEmail,
  }) async {
    final authInfo = session.authenticated;
    final userId = authInfo != null
        ? (int.tryParse(authInfo.userIdentifier) ??
              authInfo.userIdentifier.hashCode)
        : (userEmail.isNotEmpty ? userEmail.hashCode : 1);

    final existing = await FavorBookmark.db.findFirstRow(
      session,
      where: (t) =>
          t.requestId.equals(requestId) & t.userEmail.equals(userEmail),
    );

    if (existing != null) {
      await FavorBookmark.db.deleteRow(session, existing);
      return false;
    } else {
      final bookmark = FavorBookmark(
        userId: userId,
        userEmail: userEmail,
        requestId: requestId,
        createdAt: DateTime.now().toUtc(),
      );
      await FavorBookmark.db.insertRow(session, bookmark);
      return true;
    }
  }

  /// Gets recent community activity stream log.
  Future<List<UserNotification>> getCommunityActivityStream(
    Session session,
  ) async {
    var notifs = await UserNotification.db.find(
      session,
      orderBy: (t) => t.createdAt,
    );

    notifs.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return notifs.take(15).toList();
  }

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
      shareableCode:
          'SOS-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}',
      expiresAt: DateTime.now().toUtc().add(const Duration(hours: 24)),
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
    String? myActivityMode, // 'posted', 'claimed', 'saved'
  }) async {
    if (myActivityMode == 'saved' &&
        myEmailFilter != null &&
        myEmailFilter.isNotEmpty) {
      final bookmarks = await FavorBookmark.db.find(
        session,
        where: (t) => t.userEmail.equals(myEmailFilter),
      );
      final bookmarkedIds = bookmarks.map((b) => b.requestId).toSet();
      if (bookmarkedIds.isEmpty) return [];

      var requests = await HelpRequest.db.find(
        session,
        where: (t) => t.id.inSet(bookmarkedIds),
      );
      requests.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return requests;
    }

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
            r.location.toLowerCase().contains(q) ||
            (r.shareableCode != null &&
                r.shareableCode!.toLowerCase().contains(q));
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

    final code =
        'HH-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';

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
      shareableCode: code,
      expiresAt: DateTime.now().toUtc().add(const Duration(days: 3)),
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
        unlockedBadges: '🏅 First Step, 🤝 Neighbor Helper',
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
        unlockedBadges: '🏅 First Step',
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
    String badges = profile?.unlockedBadges ?? '🏅 First Step';

    if (newCompleted >= 10) {
      badge = '⚡ Community Hero';
      if (!badges.contains('⚡ Community Pillar')) {
        badges += ', ⚡ Community Pillar';
      }
    } else if (newCompleted >= 5) {
      badge = '🌟 Super Helper';
      if (!badges.contains('🌟 Speedy Helper')) {
        badges += ', 🌟 Speedy Helper';
      }
    } else if (newCompleted >= 1) {
      badge = '🤝 Active Neighbor';
      if (!badges.contains('🏅 First Favor Done')) {
        badges += ', 🏅 First Favor Done';
      }
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
        unlockedBadges: badges,
      );
      await UserProfile.db.insertRow(session, profile);
    } else {
      final updated = profile.copyWith(
        points: newPoints,
        completedCount: newCompleted,
        avatarBadge: badge,
        unlockedBadges: badges,
      );
      await UserProfile.db.updateRow(session, updated);
    }
  }
}
