import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

class HelpRequestEndpoint extends Endpoint {
  /// Fetches all help requests, optionally filtered by category or status.
  Future<List<HelpRequest>> getHelpRequests(
    Session session, {
    String? category,
    String? status,
    String? searchQuery,
  }) async {
    Expression where = Constant.bool(true);

    if (category != null && category.isNotEmpty && category != 'All') {
      where = where & HelpRequest.t.category.equals(category);
    }

    if (status != null && status.isNotEmpty && status != 'All') {
      where = where & HelpRequest.t.status.equals(status);
    }

    var requests = await HelpRequest.db.find(
      session,
      where: (t) => where,
      orderBy: (t) => t.createdAt,
    );

    requests.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    if (searchQuery != null && searchQuery.trim().isNotEmpty) {
      final q = searchQuery.trim().toLowerCase();
      requests = requests.where((r) {
        return r.title.toLowerCase().contains(q) ||
            r.description.toLowerCase().contains(q) ||
            r.location.toLowerCase().contains(q);
      }).toList();
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
    required String creatorEmail,
  }) async {
    final authInfo = session.authenticated;
    final userId = authInfo != null
        ? (int.tryParse(authInfo.userIdentifier) ?? authInfo.userIdentifier.hashCode)
        : (creatorEmail.isNotEmpty ? creatorEmail.hashCode : 1);

    final request = HelpRequest(
      title: title,
      description: description,
      category: category,
      location: location,
      urgency: urgency,
      status: 'Open',
      rewardPoints: rewardPoints,
      creatorUserId: userId,
      creatorEmail: creatorEmail.isNotEmpty ? creatorEmail : 'anonymous@helphub.com',
      createdAt: DateTime.now().toUtc(),
    );

    final inserted = await HelpRequest.db.insertRow(session, request);
    await _incrementRequestedCount(session, userId, creatorEmail);

    return inserted;
  }

  /// Claim a help request as a helper.
  Future<HelpRequest> claimHelpRequest(
    Session session, {
    required int requestId,
    required String helperEmail,
  }) async {
    final authInfo = session.authenticated;
    final userId = authInfo != null
        ? (int.tryParse(authInfo.userIdentifier) ?? authInfo.userIdentifier.hashCode)
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

    return await HelpRequest.db.updateRow(session, updated);
  }

  /// Mark a help request as completed.
  Future<HelpRequest> completeHelpRequest(
    Session session, {
    required int requestId,
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
    }

    return saved;
  }

  /// Get user profile stats for Helphub
  Future<UserProfile> getUserProfile(
    Session session, {
    required String email,
  }) async {
    final authInfo = session.authenticated;
    final userId = authInfo != null
        ? (int.tryParse(authInfo.userIdentifier) ?? authInfo.userIdentifier.hashCode)
        : (email.isNotEmpty ? email.hashCode : 1);

    final userEmail = email.isNotEmpty ? email : 'guest@helphub.com';
    final name = userEmail.contains('@') ? userEmail.split('@').first : userEmail;

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
      );
      profile = await UserProfile.db.insertRow(session, profile);
    }

    return profile;
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
        ? (int.tryParse(authInfo.userIdentifier) ?? authInfo.userIdentifier.hashCode)
        : (authorEmail.isNotEmpty ? authorEmail.hashCode : 1);

    final comment = RequestComment(
      requestId: requestId,
      authorUserId: userId,
      authorEmail: authorEmail.isNotEmpty ? authorEmail : 'neighbor@helphub.com',
      content: content,
      createdAt: DateTime.now().toUtc(),
    );

    return await RequestComment.db.insertRow(session, comment);
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
        ? (int.tryParse(authInfo.userIdentifier) ?? authInfo.userIdentifier.hashCode)
        : 1;

    final requestRating = RequestRating(
      requestId: requestId,
      fromUserId: fromUserId,
      toUserId: toUserId,
      rating: rating,
      feedback: feedback,
      createdAt: DateTime.now().toUtc(),
    );

    return await RequestRating.db.insertRow(session, requestRating);
  }

  /// Fetches top community helpers leaderboard.
  Future<List<UserProfile>> getLeaderboard(Session session) async {
    var profiles = await UserProfile.db.find(session);
    profiles.sort((a, b) => b.points.compareTo(a.points));
    return profiles.take(10).toList();
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
