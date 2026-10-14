/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _ida;
import 'package:http/http.dart' as _i85jenna;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'package:website_client/src/protocol/greetings/greeting.dart'
    as _ik0mmf5h;
import 'package:website_client/src/protocol/helphub/community_announcement.dart'
    as _if9166ew;
import 'package:website_client/src/protocol/helphub/community_group.dart'
    as _iux57j0g;
import 'package:website_client/src/protocol/helphub/favor_chat_message.dart'
    as _irf5posj;
import 'package:website_client/src/protocol/helphub/help_request.dart'
    as _ilm5roly;
import 'package:website_client/src/protocol/helphub/request_comment.dart'
    as _iq4ufam1;
import 'package:website_client/src/protocol/helphub/request_rating.dart'
    as _ib2k1m8u;
import 'package:website_client/src/protocol/helphub/skill_offer.dart'
    as _ipzxy2lt;
import 'package:website_client/src/protocol/helphub/user_notification.dart'
    as _ihs35lap;
import 'package:website_client/src/protocol/helphub/user_profile.dart'
    as _if5f0yyd;
import 'protocol.dart' as _il2as5qe;

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _iaic.EndpointEmailIdpBase {
  EndpointEmailIdp(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<_iacc.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _ida.Future<_isc.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _ida.Future<String> verifyRegistrationCode({
    required _isc.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _ida.Future<_iacc.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _ida.Future<_isc.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _ida.Future<String> verifyPasswordResetCode({
    required _isc.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _ida.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _iacc.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// If [refreshToken] is omitted, cookie-mode web clients fall back to the
  /// configured HttpOnly refresh cookie. When neither source is present this
  /// throws [RefreshTokenNotFoundException], the same public "no usable refresh
  /// credential" exception used for unknown refresh tokens.
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _ida.Future<_iacc.AuthSuccess> refreshAccessToken({String? refreshToken}) =>
      caller.callServerEndpoint<_iacc.AuthSuccess>(
        'jwtRefresh',
        'refreshAccessToken',
        {'refreshToken': refreshToken},
        authenticated: false,
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _isc.EndpointRef {
  EndpointGreeting(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _ida.Future<_ik0mmf5h.Greeting> hello(String name) =>
      caller.callServerEndpoint<_ik0mmf5h.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointHelpRequest extends _isc.EndpointRef {
  EndpointHelpRequest(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'helpRequest';

  /// Creates a new Skill/Item Offer.
  _ida.Future<_ipzxy2lt.SkillOffer> createSkillOffer({
    required String title,
    required String description,
    required String category,
    required String offererEmail,
    required String availability,
    String? neighborhoodZone,
  }) => caller.callServerEndpoint<_ipzxy2lt.SkillOffer>(
    'helpRequest',
    'createSkillOffer',
    {
      'title': title,
      'description': description,
      'category': category,
      'offererEmail': offererEmail,
      'availability': availability,
      'neighborhoodZone': neighborhoodZone,
    },
  );

  /// Gets all available skill/item offers.
  _ida.Future<List<_ipzxy2lt.SkillOffer>> getSkillOffers({
    String? category,
    String? neighborhoodZone,
  }) => caller.callServerEndpoint<List<_ipzxy2lt.SkillOffer>>(
    'helpRequest',
    'getSkillOffers',
    {
      'category': category,
      'neighborhoodZone': neighborhoodZone,
    },
  );

  /// Claims or requests an offered skill or item.
  _ida.Future<_ipzxy2lt.SkillOffer> claimSkillOffer({
    required int offerId,
    required String claimerEmail,
  }) => caller.callServerEndpoint<_ipzxy2lt.SkillOffer>(
    'helpRequest',
    'claimSkillOffer',
    {
      'offerId': offerId,
      'claimerEmail': claimerEmail,
    },
  );

  /// Creates a new local community group / circle.
  _ida.Future<_iux57j0g.CommunityGroup> createCommunityGroup({
    required String name,
    required String description,
    required String category,
    required String neighborhoodZone,
    required String leaderEmail,
  }) => caller.callServerEndpoint<_iux57j0g.CommunityGroup>(
    'helpRequest',
    'createCommunityGroup',
    {
      'name': name,
      'description': description,
      'category': category,
      'neighborhoodZone': neighborhoodZone,
      'leaderEmail': leaderEmail,
    },
  );

  /// Gets list of local community groups.
  _ida.Future<List<_iux57j0g.CommunityGroup>> getCommunityGroups() =>
      caller.callServerEndpoint<List<_iux57j0g.CommunityGroup>>(
        'helpRequest',
        'getCommunityGroups',
        {},
      );

  /// Joins a community group.
  _ida.Future<_iux57j0g.CommunityGroup> joinCommunityGroup({
    required int groupId,
    required String memberEmail,
  }) => caller.callServerEndpoint<_iux57j0g.CommunityGroup>(
    'helpRequest',
    'joinCommunityGroup',
    {
      'groupId': groupId,
      'memberEmail': memberEmail,
    },
  );

  /// Bookmarks or un-bookmarks a help request for a user.
  _ida.Future<bool> bookmarkHelpRequest({
    required int requestId,
    required String userEmail,
  }) => caller.callServerEndpoint<bool>(
    'helpRequest',
    'bookmarkHelpRequest',
    {
      'requestId': requestId,
      'userEmail': userEmail,
    },
  );

  /// Gets recent community activity stream log.
  _ida.Future<List<_ihs35lap.UserNotification>> getCommunityActivityStream() =>
      caller.callServerEndpoint<List<_ihs35lap.UserNotification>>(
        'helpRequest',
        'getCommunityActivityStream',
        {},
      );

  /// Sends a direct chat message for a claimed favor request.
  _ida.Future<_irf5posj.FavorChatMessage> sendChatMessage({
    required int requestId,
    required String message,
    required String senderEmail,
  }) => caller.callServerEndpoint<_irf5posj.FavorChatMessage>(
    'helpRequest',
    'sendChatMessage',
    {
      'requestId': requestId,
      'message': message,
      'senderEmail': senderEmail,
    },
  );

  /// Gets chat messages for a favor request.
  _ida.Future<List<_irf5posj.FavorChatMessage>> getChatMessages({
    required int requestId,
  }) => caller.callServerEndpoint<List<_irf5posj.FavorChatMessage>>(
    'helpRequest',
    'getChatMessages',
    {'requestId': requestId},
  );

  /// Completes a help request with an optional completion proof note.
  _ida.Future<_ilm5roly.HelpRequest> completeHelpRequestWithProof({
    required int requestId,
    String? proofNote,
  }) => caller.callServerEndpoint<_ilm5roly.HelpRequest>(
    'helpRequest',
    'completeHelpRequestWithProof',
    {
      'requestId': requestId,
      'proofNote': proofNote,
    },
  );

  /// Fetches community overall stats summary.
  _ida.Future<Map<String, int>> getCommunityStats() =>
      caller.callServerEndpoint<Map<String, int>>(
        'helpRequest',
        'getCommunityStats',
        {},
      );

  /// Broadcasts an urgent high-priority emergency SOS request to the community.
  _ida.Future<_ilm5roly.HelpRequest> broadcastEmergencySOS({
    required String title,
    required String description,
    required String location,
    required String creatorEmail,
    String? neighborhoodZone,
  }) => caller.callServerEndpoint<_ilm5roly.HelpRequest>(
    'helpRequest',
    'broadcastEmergencySOS',
    {
      'title': title,
      'description': description,
      'location': location,
      'creatorEmail': creatorEmail,
      'neighborhoodZone': neighborhoodZone,
    },
  );

  /// Fetches all help requests, optionally filtered by category, status, zone, emergency mode, search query, or activity filter.
  _ida.Future<List<_ilm5roly.HelpRequest>> getHelpRequests({
    String? category,
    String? status,
    String? neighborhoodZone,
    bool? isEmergency,
    String? searchQuery,
    String? sortBy,
    String? myEmailFilter,
    String? myActivityMode,
  }) => caller.callServerEndpoint<List<_ilm5roly.HelpRequest>>(
    'helpRequest',
    'getHelpRequests',
    {
      'category': category,
      'status': status,
      'neighborhoodZone': neighborhoodZone,
      'isEmergency': isEmergency,
      'searchQuery': searchQuery,
      'sortBy': sortBy,
      'myEmailFilter': myEmailFilter,
      'myActivityMode': myActivityMode,
    },
  );

  /// Creates a new help request.
  _ida.Future<_ilm5roly.HelpRequest> createHelpRequest({
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
  }) => caller.callServerEndpoint<_ilm5roly.HelpRequest>(
    'helpRequest',
    'createHelpRequest',
    {
      'title': title,
      'description': description,
      'category': category,
      'location': location,
      'urgency': urgency,
      'rewardPoints': rewardPoints,
      'isEmergency': isEmergency,
      'creatorEmail': creatorEmail,
      'neighborhoodZone': neighborhoodZone,
      'estimatedDuration': estimatedDuration,
    },
  );

  /// Upvotes a help request.
  _ida.Future<_ilm5roly.HelpRequest> upvoteHelpRequest({
    required int requestId,
  }) => caller.callServerEndpoint<_ilm5roly.HelpRequest>(
    'helpRequest',
    'upvoteHelpRequest',
    {'requestId': requestId},
  );

  /// Cancels an open or in-progress help request.
  _ida.Future<_ilm5roly.HelpRequest> cancelHelpRequest({
    required int requestId,
  }) => caller.callServerEndpoint<_ilm5roly.HelpRequest>(
    'helpRequest',
    'cancelHelpRequest',
    {'requestId': requestId},
  );

  /// Boosts reward points for an open request.
  _ida.Future<_ilm5roly.HelpRequest> boostRewardPoints({
    required int requestId,
    required int boostAmount,
  }) => caller.callServerEndpoint<_ilm5roly.HelpRequest>(
    'helpRequest',
    'boostRewardPoints',
    {
      'requestId': requestId,
      'boostAmount': boostAmount,
    },
  );

  /// Claim a help request as a helper.
  _ida.Future<_ilm5roly.HelpRequest> claimHelpRequest({
    required int requestId,
    required String helperEmail,
  }) => caller.callServerEndpoint<_ilm5roly.HelpRequest>(
    'helpRequest',
    'claimHelpRequest',
    {
      'requestId': requestId,
      'helperEmail': helperEmail,
    },
  );

  /// Mark a help request as completed.
  _ida.Future<_ilm5roly.HelpRequest> completeHelpRequest({
    required int requestId,
  }) => caller.callServerEndpoint<_ilm5roly.HelpRequest>(
    'helpRequest',
    'completeHelpRequest',
    {'requestId': requestId},
  );

  /// Tips additional bonus points to a helper for exceptional help.
  _ida.Future<bool> tipHelper({
    required int helperUserId,
    required int tipAmount,
  }) => caller.callServerEndpoint<bool>(
    'helpRequest',
    'tipHelper',
    {
      'helperUserId': helperUserId,
      'tipAmount': tipAmount,
    },
  );

  /// Get user profile stats for Helphub
  _ida.Future<_if5f0yyd.UserProfile> getUserProfile({required String email}) =>
      caller.callServerEndpoint<_if5f0yyd.UserProfile>(
        'helpRequest',
        'getUserProfile',
        {'email': email},
      );

  /// Updates user profile display name and skills tags.
  _ida.Future<_if5f0yyd.UserProfile> updateUserProfile({
    required String email,
    required String displayName,
    required String skills,
  }) => caller.callServerEndpoint<_if5f0yyd.UserProfile>(
    'helpRequest',
    'updateUserProfile',
    {
      'email': email,
      'displayName': displayName,
      'skills': skills,
    },
  );

  /// Adds a comment to a request.
  _ida.Future<_iq4ufam1.RequestComment> addComment({
    required int requestId,
    required String content,
    required String authorEmail,
  }) => caller.callServerEndpoint<_iq4ufam1.RequestComment>(
    'helpRequest',
    'addComment',
    {
      'requestId': requestId,
      'content': content,
      'authorEmail': authorEmail,
    },
  );

  /// Gets comments for a specific request.
  _ida.Future<List<_iq4ufam1.RequestComment>> getComments({
    required int requestId,
  }) => caller.callServerEndpoint<List<_iq4ufam1.RequestComment>>(
    'helpRequest',
    'getComments',
    {'requestId': requestId},
  );

  /// Submits rating and feedback for a completed request.
  _ida.Future<_ib2k1m8u.RequestRating> submitRating({
    required int requestId,
    required int toUserId,
    required int rating,
    String? feedback,
  }) => caller.callServerEndpoint<_ib2k1m8u.RequestRating>(
    'helpRequest',
    'submitRating',
    {
      'requestId': requestId,
      'toUserId': toUserId,
      'rating': rating,
      'feedback': feedback,
    },
  );

  /// Gets rating list for a user.
  _ida.Future<List<_ib2k1m8u.RequestRating>> getHelperRatings({
    required int toUserId,
  }) => caller.callServerEndpoint<List<_ib2k1m8u.RequestRating>>(
    'helpRequest',
    'getHelperRatings',
    {'toUserId': toUserId},
  );

  /// Get notifications for a user
  _ida.Future<List<_ihs35lap.UserNotification>> getUserNotifications({
    required String userEmail,
  }) => caller.callServerEndpoint<List<_ihs35lap.UserNotification>>(
    'helpRequest',
    'getUserNotifications',
    {'userEmail': userEmail},
  );

  /// Marks notification as read
  _ida.Future<bool> markNotificationRead({required int notificationId}) =>
      caller.callServerEndpoint<bool>(
        'helpRequest',
        'markNotificationRead',
        {'notificationId': notificationId},
      );

  /// Fetches top community helpers leaderboard.
  _ida.Future<List<_if5f0yyd.UserProfile>> getLeaderboard() =>
      caller.callServerEndpoint<List<_if5f0yyd.UserProfile>>(
        'helpRequest',
        'getLeaderboard',
        {},
      );

  /// Fetches community announcements.
  _ida.Future<List<_if9166ew.CommunityAnnouncement>> getAnnouncements() =>
      caller.callServerEndpoint<List<_if9166ew.CommunityAnnouncement>>(
        'helpRequest',
        'getAnnouncements',
        {},
      );

  /// Creates a new community announcement.
  _ida.Future<_if9166ew.CommunityAnnouncement> createAnnouncement({
    required String title,
    required String content,
    required String category,
    required String authorEmail,
    bool? isPinned,
  }) => caller.callServerEndpoint<_if9166ew.CommunityAnnouncement>(
    'helpRequest',
    'createAnnouncement',
    {
      'title': title,
      'content': content,
      'category': category,
      'authorEmail': authorEmail,
      'isPinned': isPinned,
    },
  );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _iaic.Caller(client);
    serverpod_auth_core = _iacc.Caller(client);
  }

  late final _iaic.Caller serverpod_auth_idp;

  late final _iacc.Caller serverpod_auth_core;
}

class Client extends _isc.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _isc.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_isc.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
    _i85jenna.Client? httpClientOverride,
  }) : super(
         host,
         _il2as5qe.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
         httpClientOverride: httpClientOverride,
       ) {
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    greeting = EndpointGreeting(this);
    helpRequest = EndpointHelpRequest(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointGreeting greeting;

  late final EndpointHelpRequest helpRequest;

  late final Modules modules;

  @override
  Map<String, _isc.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'greeting': greeting,
    'helpRequest': helpRequest,
  };

  @override
  Map<String, _isc.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
