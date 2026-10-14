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
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import '../auth/email_idp_endpoint.dart' as _iuc1hd5t;
import '../auth/jwt_refresh_endpoint.dart' as _inwq3ztq;
import '../greetings/greeting_endpoint.dart' as _il624ik7;
import '../helphub/help_request_endpoint.dart' as _i8zczuz7;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'emailIdp': _iuc1hd5t.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _inwq3ztq.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'greeting': _il624ik7.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'helpRequest': _i8zczuz7.HelpRequestEndpoint()
        ..initialize(
          server,
          'helpRequest',
          null,
        ),
    };
    connectors['emailIdp'] = _is.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint).login(
                    session,
                    email: params['email'],
                    password: params['password'],
                  ),
        ),
        'startRegistration': _is.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _is.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _is.ParameterDescription(
              name: 'accountRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _is.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _is.ParameterDescription(
              name: 'registrationToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _is.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _is.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _is.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _is.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _is.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newPassword': _is.ParameterDescription(
              name: 'newPassword',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _is.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _is.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _is.ParameterDescription(
              name: 'refreshToken',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['jwtRefresh'] as _inwq3ztq.JwtRefreshEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['greeting'] = _is.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _is.MethodConnector(
          name: 'hello',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['greeting'] as _il624ik7.GreetingEndpoint).hello(
                    session,
                    params['name'],
                  ),
        ),
      },
    );
    connectors['helpRequest'] = _is.EndpointConnector(
      name: 'helpRequest',
      endpoint: endpoints['helpRequest']!,
      methodConnectors: {
        'createSkillOffer': _is.MethodConnector(
          name: 'createSkillOffer',
          params: {
            'title': _is.ParameterDescription(
              name: 'title',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'description': _is.ParameterDescription(
              name: 'description',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'category': _is.ParameterDescription(
              name: 'category',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'offererEmail': _is.ParameterDescription(
              name: 'offererEmail',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'availability': _is.ParameterDescription(
              name: 'availability',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'neighborhoodZone': _is.ParameterDescription(
              name: 'neighborhoodZone',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .createSkillOffer(
                        session,
                        title: params['title'],
                        description: params['description'],
                        category: params['category'],
                        offererEmail: params['offererEmail'],
                        availability: params['availability'],
                        neighborhoodZone: params['neighborhoodZone'],
                      ),
        ),
        'getSkillOffers': _is.MethodConnector(
          name: 'getSkillOffers',
          params: {
            'category': _is.ParameterDescription(
              name: 'category',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'neighborhoodZone': _is.ParameterDescription(
              name: 'neighborhoodZone',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .getSkillOffers(
                        session,
                        category: params['category'],
                        neighborhoodZone: params['neighborhoodZone'],
                      ),
        ),
        'claimSkillOffer': _is.MethodConnector(
          name: 'claimSkillOffer',
          params: {
            'offerId': _is.ParameterDescription(
              name: 'offerId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'claimerEmail': _is.ParameterDescription(
              name: 'claimerEmail',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .claimSkillOffer(
                        session,
                        offerId: params['offerId'],
                        claimerEmail: params['claimerEmail'],
                      ),
        ),
        'createCommunityGroup': _is.MethodConnector(
          name: 'createCommunityGroup',
          params: {
            'name': _is.ParameterDescription(
              name: 'name',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'description': _is.ParameterDescription(
              name: 'description',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'category': _is.ParameterDescription(
              name: 'category',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'neighborhoodZone': _is.ParameterDescription(
              name: 'neighborhoodZone',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'leaderEmail': _is.ParameterDescription(
              name: 'leaderEmail',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .createCommunityGroup(
                        session,
                        name: params['name'],
                        description: params['description'],
                        category: params['category'],
                        neighborhoodZone: params['neighborhoodZone'],
                        leaderEmail: params['leaderEmail'],
                      ),
        ),
        'getCommunityGroups': _is.MethodConnector(
          name: 'getCommunityGroups',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .getCommunityGroups(session),
        ),
        'joinCommunityGroup': _is.MethodConnector(
          name: 'joinCommunityGroup',
          params: {
            'groupId': _is.ParameterDescription(
              name: 'groupId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'memberEmail': _is.ParameterDescription(
              name: 'memberEmail',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .joinCommunityGroup(
                        session,
                        groupId: params['groupId'],
                        memberEmail: params['memberEmail'],
                      ),
        ),
        'bookmarkHelpRequest': _is.MethodConnector(
          name: 'bookmarkHelpRequest',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'userEmail': _is.ParameterDescription(
              name: 'userEmail',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .bookmarkHelpRequest(
                        session,
                        requestId: params['requestId'],
                        userEmail: params['userEmail'],
                      ),
        ),
        'getCommunityActivityStream': _is.MethodConnector(
          name: 'getCommunityActivityStream',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .getCommunityActivityStream(session),
        ),
        'sendChatMessage': _is.MethodConnector(
          name: 'sendChatMessage',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'message': _is.ParameterDescription(
              name: 'message',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'senderEmail': _is.ParameterDescription(
              name: 'senderEmail',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .sendChatMessage(
                        session,
                        requestId: params['requestId'],
                        message: params['message'],
                        senderEmail: params['senderEmail'],
                      ),
        ),
        'getChatMessages': _is.MethodConnector(
          name: 'getChatMessages',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .getChatMessages(
                        session,
                        requestId: params['requestId'],
                      ),
        ),
        'completeHelpRequestWithProof': _is.MethodConnector(
          name: 'completeHelpRequestWithProof',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'proofNote': _is.ParameterDescription(
              name: 'proofNote',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .completeHelpRequestWithProof(
                        session,
                        requestId: params['requestId'],
                        proofNote: params['proofNote'],
                      ),
        ),
        'getCommunityStats': _is.MethodConnector(
          name: 'getCommunityStats',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .getCommunityStats(session),
        ),
        'broadcastEmergencySOS': _is.MethodConnector(
          name: 'broadcastEmergencySOS',
          params: {
            'title': _is.ParameterDescription(
              name: 'title',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'description': _is.ParameterDescription(
              name: 'description',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'location': _is.ParameterDescription(
              name: 'location',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'creatorEmail': _is.ParameterDescription(
              name: 'creatorEmail',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'neighborhoodZone': _is.ParameterDescription(
              name: 'neighborhoodZone',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .broadcastEmergencySOS(
                        session,
                        title: params['title'],
                        description: params['description'],
                        location: params['location'],
                        creatorEmail: params['creatorEmail'],
                        neighborhoodZone: params['neighborhoodZone'],
                      ),
        ),
        'getHelpRequests': _is.MethodConnector(
          name: 'getHelpRequests',
          params: {
            'category': _is.ParameterDescription(
              name: 'category',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'status': _is.ParameterDescription(
              name: 'status',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'neighborhoodZone': _is.ParameterDescription(
              name: 'neighborhoodZone',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'isEmergency': _is.ParameterDescription(
              name: 'isEmergency',
              type: _is.getType<bool?>(),
              nullable: true,
            ),
            'searchQuery': _is.ParameterDescription(
              name: 'searchQuery',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'sortBy': _is.ParameterDescription(
              name: 'sortBy',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'myEmailFilter': _is.ParameterDescription(
              name: 'myEmailFilter',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'myActivityMode': _is.ParameterDescription(
              name: 'myActivityMode',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .getHelpRequests(
                        session,
                        category: params['category'],
                        status: params['status'],
                        neighborhoodZone: params['neighborhoodZone'],
                        isEmergency: params['isEmergency'],
                        searchQuery: params['searchQuery'],
                        sortBy: params['sortBy'],
                        myEmailFilter: params['myEmailFilter'],
                        myActivityMode: params['myActivityMode'],
                      ),
        ),
        'createHelpRequest': _is.MethodConnector(
          name: 'createHelpRequest',
          params: {
            'title': _is.ParameterDescription(
              name: 'title',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'description': _is.ParameterDescription(
              name: 'description',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'category': _is.ParameterDescription(
              name: 'category',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'location': _is.ParameterDescription(
              name: 'location',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'urgency': _is.ParameterDescription(
              name: 'urgency',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'rewardPoints': _is.ParameterDescription(
              name: 'rewardPoints',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'isEmergency': _is.ParameterDescription(
              name: 'isEmergency',
              type: _is.getType<bool?>(),
              nullable: true,
            ),
            'creatorEmail': _is.ParameterDescription(
              name: 'creatorEmail',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'neighborhoodZone': _is.ParameterDescription(
              name: 'neighborhoodZone',
              type: _is.getType<String?>(),
              nullable: true,
            ),
            'estimatedDuration': _is.ParameterDescription(
              name: 'estimatedDuration',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .createHelpRequest(
                        session,
                        title: params['title'],
                        description: params['description'],
                        category: params['category'],
                        location: params['location'],
                        urgency: params['urgency'],
                        rewardPoints: params['rewardPoints'],
                        isEmergency: params['isEmergency'],
                        creatorEmail: params['creatorEmail'],
                        neighborhoodZone: params['neighborhoodZone'],
                        estimatedDuration: params['estimatedDuration'],
                      ),
        ),
        'upvoteHelpRequest': _is.MethodConnector(
          name: 'upvoteHelpRequest',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .upvoteHelpRequest(
                        session,
                        requestId: params['requestId'],
                      ),
        ),
        'cancelHelpRequest': _is.MethodConnector(
          name: 'cancelHelpRequest',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .cancelHelpRequest(
                        session,
                        requestId: params['requestId'],
                      ),
        ),
        'boostRewardPoints': _is.MethodConnector(
          name: 'boostRewardPoints',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'boostAmount': _is.ParameterDescription(
              name: 'boostAmount',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .boostRewardPoints(
                        session,
                        requestId: params['requestId'],
                        boostAmount: params['boostAmount'],
                      ),
        ),
        'claimHelpRequest': _is.MethodConnector(
          name: 'claimHelpRequest',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'helperEmail': _is.ParameterDescription(
              name: 'helperEmail',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .claimHelpRequest(
                        session,
                        requestId: params['requestId'],
                        helperEmail: params['helperEmail'],
                      ),
        ),
        'completeHelpRequest': _is.MethodConnector(
          name: 'completeHelpRequest',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .completeHelpRequest(
                        session,
                        requestId: params['requestId'],
                      ),
        ),
        'tipHelper': _is.MethodConnector(
          name: 'tipHelper',
          params: {
            'helperUserId': _is.ParameterDescription(
              name: 'helperUserId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'tipAmount': _is.ParameterDescription(
              name: 'tipAmount',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .tipHelper(
                        session,
                        helperUserId: params['helperUserId'],
                        tipAmount: params['tipAmount'],
                      ),
        ),
        'getUserProfile': _is.MethodConnector(
          name: 'getUserProfile',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .getUserProfile(
                        session,
                        email: params['email'],
                      ),
        ),
        'updateUserProfile': _is.MethodConnector(
          name: 'updateUserProfile',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'displayName': _is.ParameterDescription(
              name: 'displayName',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'skills': _is.ParameterDescription(
              name: 'skills',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .updateUserProfile(
                        session,
                        email: params['email'],
                        displayName: params['displayName'],
                        skills: params['skills'],
                      ),
        ),
        'addComment': _is.MethodConnector(
          name: 'addComment',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'content': _is.ParameterDescription(
              name: 'content',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'authorEmail': _is.ParameterDescription(
              name: 'authorEmail',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .addComment(
                        session,
                        requestId: params['requestId'],
                        content: params['content'],
                        authorEmail: params['authorEmail'],
                      ),
        ),
        'getComments': _is.MethodConnector(
          name: 'getComments',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .getComments(
                        session,
                        requestId: params['requestId'],
                      ),
        ),
        'submitRating': _is.MethodConnector(
          name: 'submitRating',
          params: {
            'requestId': _is.ParameterDescription(
              name: 'requestId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'toUserId': _is.ParameterDescription(
              name: 'toUserId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'rating': _is.ParameterDescription(
              name: 'rating',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'feedback': _is.ParameterDescription(
              name: 'feedback',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .submitRating(
                        session,
                        requestId: params['requestId'],
                        toUserId: params['toUserId'],
                        rating: params['rating'],
                        feedback: params['feedback'],
                      ),
        ),
        'getHelperRatings': _is.MethodConnector(
          name: 'getHelperRatings',
          params: {
            'toUserId': _is.ParameterDescription(
              name: 'toUserId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .getHelperRatings(
                        session,
                        toUserId: params['toUserId'],
                      ),
        ),
        'getUserNotifications': _is.MethodConnector(
          name: 'getUserNotifications',
          params: {
            'userEmail': _is.ParameterDescription(
              name: 'userEmail',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .getUserNotifications(
                        session,
                        userEmail: params['userEmail'],
                      ),
        ),
        'markNotificationRead': _is.MethodConnector(
          name: 'markNotificationRead',
          params: {
            'notificationId': _is.ParameterDescription(
              name: 'notificationId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .markNotificationRead(
                        session,
                        notificationId: params['notificationId'],
                      ),
        ),
        'getLeaderboard': _is.MethodConnector(
          name: 'getLeaderboard',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .getLeaderboard(session),
        ),
        'getAnnouncements': _is.MethodConnector(
          name: 'getAnnouncements',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .getAnnouncements(session),
        ),
        'createAnnouncement': _is.MethodConnector(
          name: 'createAnnouncement',
          params: {
            'title': _is.ParameterDescription(
              name: 'title',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'content': _is.ParameterDescription(
              name: 'content',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'category': _is.ParameterDescription(
              name: 'category',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'authorEmail': _is.ParameterDescription(
              name: 'authorEmail',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'isPinned': _is.ParameterDescription(
              name: 'isPinned',
              type: _is.getType<bool?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['helpRequest'] as _i8zczuz7.HelpRequestEndpoint)
                      .createAnnouncement(
                        session,
                        title: params['title'],
                        content: params['content'],
                        category: params['category'],
                        authorEmail: params['authorEmail'],
                        isPinned: params['isPinned'],
                      ),
        ),
      },
    );
    modules['serverpod_auth_idp'] = _iais.Endpoints()
      ..initializeEndpoints(server);
    modules['serverpod_auth_core'] = _iacs.Endpoints()
      ..initializeEndpoints(server);
  }
}
